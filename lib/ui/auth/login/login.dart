import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "login";

  LoginPage({Key? key}) : super(key: key);
  final _otpController = TextEditingController();
  final _controller = TextEditingController();
  String _phoneNumber = "";
  bool _isLoading = false;

  final _auth = FirebaseAuth.instance;

  void get_otp_button(String phoneNumber, BuildContext ctx) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phCredentials) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 2000),
            content: SizedBox(
                height: 16,
                child: Center(child: Center(child: Text("Number Verified")))),
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
        );
        _auth.signInWithCredential(phCredentials);
      },
      verificationFailed: (fbAuthException) {
        var msg = "Some went wrong.";
        if (fbAuthException.code == 'invalid-phone-number') {
          msg = 'Phone number is not valid.';
        }
        ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 2000),
            content: SizedBox(
                height: 16, child: Center(child: Center(child: Text(msg)))),
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
      codeSent: (verificationId, resentCode) {
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
        showModalBottomSheet(
            context: ctx,
            elevation: 2,
            builder: (c) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Enter OTP"),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    controller: _otpController,
                    onEditingComplete: () {},
                  ),
                  ElevatedButton(
                    // key: _otpConfirmKey,
                    onPressed: () async {
                      final smscode = _otpController.text.trim();
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                        verificationId: verificationId,
                        smsCode: smscode,
                      );
                      UserCredential result =
                          await _auth.signInWithCredential(credential);
                      if (result.user != null) {
                        Navigator.of(c).pop();
                      } else {
                        print("error otp type");
                      }
                      //
                    },
                    style: ElevatedButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Text("Confirm"),
                  )
                ],
              );
            });
        //
      },
      codeAutoRetrievalTimeout: (verificationId) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(
            content:
                SizedBox(height: 16, child: Center(child: Text("Timeout"))),
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
    );

    // Navigator.of(ctx).pushReplacementNamed(TabView.routeName);
    // var IF = Provider.of<InfoFlower>(ctx, listen: false);
    // IF.stateChanger();
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
              height: size.height * 0.08,
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
                        maxLength: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                String num = "+91${_controller.text.trim()}";
                get_otp_button(num, context);
                _isLoading = true;
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
              child: Text(
                "GET OTP",
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
    );
  }
}
