import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../terms/terms.dart';
import 'rgstcheck.dart';

// First page in signup process.

// enum CurrState {
//   CNA,
//   RGST,
//   FORM,
// }

class SignupPage extends StatefulWidget {
  static const routeName = "signup";
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
  final _otpConfirmKey = GlobalKey<State>(); // no use
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

  void resend() {}

  void _otpVerification(String number) async {
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
            readonly[2] = false;
            readonly[3] = false;
            clickable = true;
          });
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: SizedBox(
              height: 16, child: Center(child: Text("Something went wrong"))),
          duration: Duration(milliseconds: 2000),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
      print(err);
    }
  }

  void continueButton(String verifyID, String smscode) async {
    // confirm button function.
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: SizedBox(
              height: 16, child: Center(child: Text("Validation failed."))),
          duration: Duration(milliseconds: 2000),
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
      );
    }

    try {
      credential = PhoneAuthProvider.credential(
          verificationId: verificationIdTemporary, smsCode: smscode);

      await _auth.signInWithCredential(credential);
    } catch (err) {
      _otpController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SizedBox(
              height: 38,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Something went wrong"),
                    Text("Type OTP Again."),
                  ])),
          duration: const Duration(milliseconds: 2000),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
      );
    }
    print(CreateInfo);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //

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
                    child: Padding(
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
                              onEditingComplete: () async {
                                String num =
                                    "+91${_numberController.text.trim()}";
                                _otpVerification(num);
                              }, // task otp verification starts here.
                            ),
                          ),
                        ],
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
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const SizedBox(
                          //   width: 6,
                          // ),
                          Flexible(
                            child: TextFormField(
                              readOnly: readonly[1],
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "One Time Password",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                                contentPadding: EdgeInsets.only(
                                  left: 14,
                                ),
                              ),
                              controller: _otpController,
                              keyboardType: TextInputType.number,
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
                          )
                        ],
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
                          if (val != null) CreateInfo['name'] = val;
                        },
                        validator: (val) {
                          // if (val) {
                          //   return "Enter valid email.";
                          // }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(
                            left: 14,
                          ),
                        ),
                        readOnly: readonly[2],
                        keyboardType: TextInputType.name,
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
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          contentPadding: EdgeInsets.only(
                            left: 14,
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
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
              onPressed: clickable
                  ? () {
                      String tmp = "";
                      if (_otpController.text.trim().length == 6) {
                        tmp = _otpController.text.trim();
                      }
                      continueButton(verificationIdTemporary, tmp);
                    }
                  : null,
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
                      fontSize: 13,
                    ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 22, right: 22, top: 5, bottom: 3),
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
              child: TextButton(
                onPressed: () {
                  MaterialPageRoute(
                    builder: (context) => Scaffold(body: TermsAndConditions()),
                  );
                },
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
            ),
            const Spacer(),
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
