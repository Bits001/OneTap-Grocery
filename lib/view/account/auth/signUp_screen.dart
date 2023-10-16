import 'package:ecommerce_app/components/input_outlineButton.dart';
import 'package:ecommerce_app/view/account/auth/signIn_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/input_textButton.dart';
import '../../../components/input_textField.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                child: const Icon(Icons.arrow_back_rounded),
              ),
              const Spacer(),

              const Text(
                "Create an Account",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Row(
                children: <Widget>[
                  Text(
                    "Sign up to get",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    " started",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
              // const Text(
              //   "Sign up ",

              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 20,
              //     fontWeight: FontWeight.w600,
              //     letterSpacing: 1.5,
              //   ),
              // ),


              const Spacer(
                flex: 1,
              ),

//Confirm Full Name
              const InputTextField(
                title: 'Full Name',
              ),
              const SizedBox(
                height: 10,
              ),
//Confirm Email Address field
              const InputTextField(
                title: 'Email address',
              ),
              const SizedBox(
                height: 10,
              ),
//Confirm Password field
              const InputTextField(
                title: 'Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

//Confirm Password field
              const InputTextField(
                title: 'Confirm Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    'Joined us before?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ));
                    },
                    child: const Text(
                      " Sign In",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
// Sign Up button
              InputTextButton(
                title: " Sign up",
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
        ),
      ),
    );
  }
}
