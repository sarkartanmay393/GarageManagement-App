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
  var credential; // will hold user auth credentials.
  final _auth = FirebaseAuth.instance;
  List<bool> readonly = [false, true, true]; // used readonly funciton this how.

  void _otpVerification(String number) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: number,
        // timeout: const Duration(seconds: 30),
        verificationCompleted: (phCredentials) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(milliseconds: 2000),
              content: SizedBox(
                  height: 28,
                  child: Center(child: Center(child: Text("Number Verified")))),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
          credential = phCredentials;
          readonly[0] = true;
          readonly[1] = false;
          readonly[2] = false;
          clickable = true;
        },
        verificationFailed: (fbAuthException) {
          var msg = "Some went wrong.";
          if (fbAuthException.code == 'invalid-phone-number') {
            msg = 'Phone number is not valid.';
          }
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 1000),
              content: SizedBox(height: 28, child: Center(child: Text(msg))),
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
          );
        },
        codeSent: (verificationId, forceResendingToken) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  SizedBox(height: 28, child: Center(child: Text("Code Sent"))),
              duration: Duration(milliseconds: 2000),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          );
          // String smsCode = _otpController.text;
          // PhoneAuthCredential temp_credential = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);
          // readonly[0] = false;
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Center(child: Text("Enter OTP")),
          //     duration: Duration(milliseconds: 200),
          //     padding: EdgeInsets.symmetric(vertical: 8),
          //   ),
          // );
          // String smsCode = "";
          showModalBottomSheet(
              context: context,
              elevation: 2,
              enableDrag: true,
              builder: (c) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Enter OTP"),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        controller: _otpController,
                        onEditingComplete: () {},
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      ElevatedButton(
                        // key: _otpConfirmKey,
                        onPressed: () async {
                          final smscode = _otpController.text.trim();
                          credential = PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: smscode,
                          );
                          // ignore: unnecessary_null_comparison
                          if ((credential as PhoneAuthCredential) != null) {
                            readonly[0] = true;
                            readonly[1] = false;
                            readonly[2] = false;
                            clickable = true;
                            Navigator.of(c).pop();
                          } else {
                            print("error otp type");
                          }

                          // UserCredential result =
                          //     await _auth.signInWithCredential(credential);
                          // if (result.user != null) {
                          //   Navigator.of(c).pop();
                          // } else {
                          //   print("error otp type");
                          // }
                          //
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        child: const Text("Confirm"),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                );
              });
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verificationId = verificationId;
          // print(verificationId);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Timeout"),
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            ),
          );
        },
      );
    } catch (err) {
      print(err);
    }
  }

  void confirmButton() async {
    // confirm button function.
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    pushNewScreenWithRouteSettings(
      context,
      screen: const RgstCheck(),
      settings: RouteSettings(
        name: RgstCheck.routeName,
        arguments: credential as PhoneAuthCredential,
      ),
    );

    // UserCredential authResult;
    // if (await _otpVerification(CreateInfo["number"]!)) {}

    try {
      // authResult = await _auth.createUserWithEmailAndPassword(
      // email: CreateInfo["email"]!, password: CreateInfo[""]);
    } catch (err) {
      return null;
    }

    print(CreateInfo);
    // Navigator.of(context).pushNamed(RgstCheck.routeName);
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
                              onEditingComplete: () {
                                String num =
                                    "+91${_numberController.text.trim()}";
                                print("func hitted");
                                _otpVerification(num);
                                print("func closed");
                              }, // => _otpVerification,
                              controller: _numberController,
                              // onFieldSubmitted: (num) => _otpVerification,
                              textInputAction: TextInputAction.send,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // Card(
                  //   margin: EdgeInsets.symmetric(
                  //     vertical: size.height * 0.005,
                  //     horizontal: size.width * 0.07,
                  //   ),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(22),
                  //   ),
                  //   elevation: 2,
                  //   color: Colors.white,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //       horizontal: 8,
                  //       vertical: 2,
                  //     ),
                  //     child: Row(
                  //       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         // const SizedBox(
                  //         //   width: 6,
                  //         // ),
                  //         Flexible(
                  //           child: TextFormField(
                  //             readOnly: readonly[0],
                  //             decoration: const InputDecoration(
                  //               border: InputBorder.none,
                  //               hintText: "One Time Password",
                  //               hintStyle: TextStyle(
                  //                   fontSize: 14, fontWeight: FontWeight.w500),
                  //               contentPadding: EdgeInsets.only(
                  //                 left: 14,
                  //               ),
                  //             ),
                  //             controller: _otpController,
                  //             keyboardType: TextInputType.number,
                  //             maxLength: null,
                  //           ),
                  //         ),
                  //         TextButton(
                  //           onPressed: () {},
                  //           style: ButtonStyle(
                  //             splashFactory: InkSparkle
                  //                 .constantTurbulenceSeedSplashFactory,
                  //             // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                  //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //             minimumSize:
                  //                 MaterialStateProperty.all(const Size(0, 5)),
                  //           ),
                  //           child: Text(
                  //             "Resend OTP",
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .displaySmall!
                  //                 .copyWith(
                  //                   color: Colors.black,
                  //                   fontSize: 11,
                  //                   fontWeight: FontWeight.w500,
                  //                 ),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
                        readOnly: readonly[1],
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
                        readOnly: readonly[1],
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
              onPressed: clickable ? confirmButton : null,
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
                "CONFIRM",
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
