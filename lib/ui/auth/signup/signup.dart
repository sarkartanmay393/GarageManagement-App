import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Shared Preference for isLoggedIn bool.

import 'rgstcheck.dart';

// First page in signup process.

class SignupPage extends StatefulWidget {
  static const routeName = "signup";
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // ignore: non_constant_identifier_names
  Map<String, String> CreateInfo = {
    // it will contain user info after pressing next.
    "email": "",
    "name": "",
    "number": "",
  };
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _numberController = TextEditingController();
  bool clickable = false; // for the confirm button
  // final _otpConfirmKey = GlobalKey<State>(); // no use
  PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: "", smsCode: ""); // will hold user auth credentials.
  final _auth = FirebaseAuth.instance;
  List<bool> readonly = [
    false,
    true,
    true,
    true
  ]; // used readonly funciton this how.
  bool resendPossible = false; // defines that currently resend is possible
  //or not by taking the charge of clickablity.
  String verificationIdTemporary = ""; // will hold veri. id for a small time.
  bool _numberLoading = false;
  bool _otpLoading = false;

  void resend() {}

  void _verifyOtp(String code) async {
    setState(() {
      _otpLoading = true;
    });
    try {
      await _auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationIdTemporary, smsCode: code))
          .then((value) async {
        if (value.user != null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          setState(() {
            readonly[0] = true;
            readonly[1] = true;
            readonly[2] = false;
            readonly[3] = false;
            clickable = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 2000),
              content: SizedBox(
                  height: 16, child: Center(child: Text("Number Verified"))),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('isLoggedIn', true);
        }
      });
    } catch (e) {
      debugPrint("OTP error :${e.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 2000),
          content:
              SizedBox(height: 16, child: Center(child: Text("Wrong OTP"))),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
    }
    setState(() {
      _otpLoading = false;
    });
  }

  void _numVerify(String number) async {
    setState(() {
      _numberLoading = true;
    });
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (phCredentials) {
          credential = phCredentials;
          setState(() {
            readonly[0] = true;
            readonly[1] = true;
            readonly[2] = false;
            readonly[3] = false;
            clickable = true;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 2000),
              content: SizedBox(
                  height: 16, child: Center(child: Text("Number Verified"))),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
          // more work needed for auto verification.
          // not done yet.
        },
        verificationFailed: (fbAuthException) {
          var msg = "Verification Failed";
          if (fbAuthException.code == 'invalid-phone-number') {
            msg = 'Phone number is not valid';
          }
          setState(() {
            readonly[0] = false;
            readonly[1] = true;
            readonly[2] = true;
            readonly[3] = true;
            clickable = false;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 2000),
              content: SizedBox(height: 16, child: Center(child: Text(msg))),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          );
        },
        codeSent: (verificationId, forceResendingToken) {
          verificationIdTemporary = verificationId;
          setState(() {
            readonly[0] = true;
            readonly[1] = false;
            readonly[2] = true;
            readonly[3] = true;
            clickable = false;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  SizedBox(height: 16, child: Center(child: Text("Code Sent"))),
              duration: Duration(milliseconds: 2000),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
          //
        },
        codeAutoRetrievalTimeout: (verificationId) {
          setState(() {
            readonly[0] = false;
            readonly[1] = true;
            readonly[2] = true;
            readonly[3] = true;
            clickable = false;
          });
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  SizedBox(height: 16, child: Center(child: Text("Timeout"))),
              duration: Duration(milliseconds: 2000),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
        },
      );
    } catch (err) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: SizedBox(
              height: 16, child: Center(child: Text("Something went wrong"))),
          duration: Duration(milliseconds: 2000),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
      debugPrint(err.toString());
    }
    setState(() {
      _numberLoading = false;
    });
  }

  void continueButton() async {
    // confirm button function.
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pushNewScreen(context, screen: const RgstCheck());
    }
  }

  @override
  void dispose() {
    super.dispose();
    _numberController.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.5, 0],
          ),
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.12,
            ),
            Text(
              "BEE",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "We Keep Your Engine",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            Text(
              "Running",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Text(
              "Create a New Account !",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                    // shadows: [
                    //   Shadow(),
                    // ],
                  ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Form(
              key: _formKey,
              child: Wrap(
                children: [
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.45),
                          child: SizedBox(
                            height: 1,
                            width: size.width * 0.8,
                            child: _numberLoading
                                ? const LinearProgressIndicator()
                                : null,
                          ),
                        ), // not working.
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "icons/flags/png/in.png",
                                  package: "country_icons",
                                ),
                                radius: 16,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Flexible(
                                child: TextFormField(
                                  onSaved: (val) {
                                    if (val != null) CreateInfo['number'] = val;
                                  },
                                  decoration: const InputDecoration(
                                    // hintText: "Phone",
                                    // hintStyle: TextStyle(
                                    //     fontSize: 14, fontWeight: FontWeight.w500),
                                    contentPadding: EdgeInsets.only(
                                      left: 14,
                                    ),
                                    border: InputBorder.none,
                                    prefixText: "+91  ",
                                  ),
                                  readOnly: readonly[0],
                                  keyboardType: TextInputType.number,
                                  maxLength: null,
                                  controller: _numberController,
                                  textInputAction: TextInputAction.send,
                                  onChanged: (_) async {
                                    if (_numberController.text.trim().length ==
                                        10) {
                                      String num =
                                          _numberController.text.trim();
                                      _numVerify("+91$num");
                                    }
                                  },
                                  onFieldSubmitted: (String num) async {
                                    if (num.trim().length == 10) {
                                      _numVerify("+91$num");
                                    }
                                  },
                                  // task otp verification starts here.
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: TextFormField(
                              readOnly: readonly[1],
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "One Time Password",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: readonly[1]
                                        ? Colors.grey.shade400
                                        : Colors.grey.shade700),
                                contentPadding: const EdgeInsets.only(
                                  left: 14,
                                ),
                              ),
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onChanged: (_) async {
                                if (_otpController.text.trim().length == 6) {
                                  _verifyOtp(_otpController.text.trim());
                                } else {
                                  // _formKey.currentState!.validate();
                                }
                              },
                              maxLength: null,
                            ),
                          ),
                          TextButton(
                            onPressed: resendPossible ? resend : null,
                            style: ButtonStyle(
                              splashFactory: InkSparkle
                                  .constantTurbulenceSeedSplashFactory,
                              // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              minimumSize:
                                  MaterialStateProperty.all(const Size(0, 5)),
                            ),
                            child: Text(
                              "Resend OTP",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: TextFormField(
                        onSaved: (val) {
                          if (val != null) CreateInfo['name'] = val;
                        },
                        validator: (val) {
                          // if (val) {
                          //   return "Enter valid email.";
                          // }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: readonly[2]
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade700),
                          contentPadding: const EdgeInsets.only(
                            left: 14,
                          ),
                        ),
                        readOnly: readonly[2],
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        maxLength: null,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.07,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    elevation: 2,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      child: TextFormField(
                        onSaved: (val) {
                          if (val != null) CreateInfo['email'] = val;
                        },
                        validator: (val) {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)) {
                            return "Enter valid email.";
                          }
                          return null;
                        },
                        readOnly: readonly[3],
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: readonly[3]
                                  ? Colors.grey.shade400
                                  : Colors.grey.shade700),
                          contentPadding: const EdgeInsets.only(
                            left: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        maxLength: null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: clickable ? continueButton : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(size.width * 0.8, size.height * 0.05),
                ),
                maximumSize: MaterialStateProperty.all(
                  Size(size.width * 0.9, size.height * 0.08),
                ),
                elevation: MaterialStateProperty.all(6),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              child: Text(
                "CONTINUE",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: clickable ? Colors.white : Colors.white54,
                      fontSize: 13,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 22, right: 22, top: 10, bottom: 3),
              child: Text(
                "By signing in you agree to our",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Terms of Service & Privacy Policy",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   width: size.width * 0.25,
                // ),
                Text(
                  "Don’t have an account?",
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("login");
                  },
                  style: ButtonStyle(
                    splashFactory:
                        InkSparkle.constantTurbulenceSeedSplashFactory,
                    // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: MaterialStateProperty.all(const Size(0, 5)),
                  ),
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Colors.red,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
