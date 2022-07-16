import 'package:bee/state/provider.dart';
import 'package:bee/ui/TabView.dart';
import 'package:bee/ui/auth/signup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "login";
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _otpController = TextEditingController();
  final _controller = TextEditingController();

  Color termsTextColor = Colors.grey.shade600; // didnot work, how I thought.

  bool readonly = true;
  bool _isLoading = false;
  bool resendPossible = false;
  String verificationIdTemporary = "";
  String saveTypeNumber = "";

  final _auth = FirebaseAuth.instance;

  void resend() {}

  void continueFurtherInLoginProcess(
      String verificationId, String smscode) async {
    if (verificationId.isEmpty) {
      return;
    }
    setState(() {
      _isLoading = true;
    });
    // final smscode = _otpController.text.trim();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smscode,
    );
    try {
      await _auth.signInWithCredential(credential).then((value) {
        if (value.additionalUserInfo!.isNewUser) {
          Provider.of<InfoFlower>(context, listen: false).loginStateChanger();
          Provider.of<InfoFlower>(context, listen: false)
              .addValueGarage(key: "Phone", val: saveTypeNumber);
          Provider.of<InfoFlower>(context, listen: false)
              .addValueTowingVan(key: "Driver Phone", val: saveTypeNumber);
          pushNewScreenWithRouteSettings(
            context,
            screen: const SignupPage(),
            settings: const RouteSettings(
              name: SignupPage.routeName,
              arguments: true,
            ),
          );
        } else {
          pushNewScreen(context, screen: const TabView());
        }
      });
    } catch (err) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 2000),
          content: SizedBox(
              height: 16,
              child: Center(child: Center(child: Text(err.toString())))),
          padding: const EdgeInsets.symmetric(vertical: 8),
        ),
      );
    }
    // setState(() {
    //   _isLoading = false;
    // });
    //
  }

  // ignore: non_constant_identifier_names
  void get_otp_button(String phoneNumber, BuildContext ctx) async {
    setState(() {
      _isLoading = true;
    });
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (autoCreds) async {
        ScaffoldMessenger.of(ctx).clearSnackBars();
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 2000),
            content: SizedBox(
                height: 16,
                child: Center(child: Center(child: Text("Number Verified")))),
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
        );
        setState(() {
          _isLoading = false;
        });
        await _auth.signInWithCredential(autoCreds);
      },
      verificationFailed: (fbAuthException) async {
        var msg = "Some went wrong.";
        if (fbAuthException.code == 'invalid-phone-number') {
          msg = 'Phone number is not valid.';
        }
        setState(() {
          _isLoading = false;
          readonly = true;
        });
        ScaffoldMessenger.of(ctx).clearSnackBars();
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: SizedBox(
              height: 16,
              child: Center(
                child: Center(
                  child: Text(msg.length < 22 ? msg.substring(0, 22) : msg),
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
      codeSent: (verificationId, resentCode) async {
        setState(() {
          _isLoading = false;
          verificationIdTemporary = verificationId;
          readonly = false;
        });
        ScaffoldMessenger.of(ctx).clearSnackBars();
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 2000),
            content: SizedBox(
                height: 16,
                child: Center(child: Center(child: Text("Code Sent")))),
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
        );
        //
      },
      codeAutoRetrievalTimeout: (verificationId) async {
        setState(() {
          _isLoading = false;
          readonly = true;
        });
        ScaffoldMessenger.of(ctx).clearSnackBars();
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            content:
                SizedBox(height: 16, child: Center(child: Text("Timeout"))),
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
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
                height: size.height * 0.15,
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
                height: size.height * 0.12,
              ),
              Text(
                "Glad to you here !",
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
                height: size.height * 0.06,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                  horizontal: size.width * 0.1,
                ),
                child: Text(
                  "Login using your mobile number.",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                ),
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
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          "icons/flags/png/in.png",
                          package: "country_icons",
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixText: "+91  ",
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.send,
                          onChanged: (_) async {
                            if (_controller.text.trim().length == 10) {
                              String num = _controller.text.trim();
                              saveTypeNumber = "+91$num";
                              get_otp_button("+91$num", context);
                            }
                          },
                          onFieldSubmitted: (String num) async {
                            if (num.trim().length == 10) {
                              saveTypeNumber = "+91$num";
                              get_otp_button("+91$num", context);
                            }
                          },
                          maxLength: null,
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
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: TextFormField(
                          readOnly: readonly,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: readonly
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
                              continueFurtherInLoginProcess(
                                verificationIdTemporary,
                                _otpController.text.trim(),
                              );
                            }
                          },
                          onFieldSubmitted: (val) {
                            if (val.trim().length == 6) {
                              continueFurtherInLoginProcess(
                                  verificationIdTemporary, val.trim());
                            }
                          },
                          maxLength: null,
                        ),
                      ),
                      TextButton(
                        onPressed: resendPossible ? resend : null,
                        style: ButtonStyle(
                          splashFactory:
                              InkSparkle.constantTurbulenceSeedSplashFactory,
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
              ElevatedButton(
                onPressed: () {
                  continueFurtherInLoginProcess(
                      verificationIdTemporary, _otpController.text.trim());
                },
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
                child: _isLoading
                    ? SizedBox(
                        height: size.height * 0.04,
                        width: size.width * 0.04,
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Text(
                        "CONTINUE",
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.bold,
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
                child: InkWell(
                  // splashColor: Colors.red,
                  // onHover: (val) {
                  //   setState(() {
                  //     termsTextColor = Colors.red;
                  //   });
                  // },
                  onTap: () {},
                  child: Text(
                    "Terms of Service & Privacy Policy",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: termsTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ),
              Spacer(),
              // SizedBox(
              //   height: size.height * (showOtpBar ? 0.22 : 0.26),
              // ),
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
                      Navigator.of(context).pushNamed("signup");
                    },
                    style: ButtonStyle(
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.all(const Size(0, 5)),
                    ),
                    child: Text(
                      "Create",
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
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _otpController.dispose();
  }
}
