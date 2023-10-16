import 'package:ecommerce_app/components/input_textButton.dart';
import 'package:ecommerce_app/components/input_textField.dart';
import 'package:ecommerce_app/view/account/auth/signUp_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 1,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
              ),
            ),
            const Spacer(),
            const Text(
              "Welcome to oneTap|Grocery",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Sign in to your account",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            const InputTextField(
              title: 'Email address',
            ),
            const SizedBox(
              height: 10,
            ),
            const InputTextField(
              title: 'Password',
              obsecureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Don't have an account? ",
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ));
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InputTextButton(
              title: 'Sign In',
              onClick: () {},
            ),
            // InputTextButton(
            //   title: 'Back',
            //   onClick: () {},
            // ),
            const Spacer(
              flex: 5,
            ),

            //  const Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "Don't have an account?",
            //       ),
            //       InkWell(
            //         child: Text(
            //           "Sign up",
            //           style: TextStyle(
            //             color: Colors.redAccent,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       )
            //     ],
            //   )
          ],
        ),
      )),
    );
  }
}
