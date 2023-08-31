import 'package:flutter/material.dart';
import 'package:sportify/constant/colors.dart';
import 'package:sportify/widgets/signup_widgets/signup_4/signup_4_inputs.dart';


class SignUp4 extends StatefulWidget {
  const SignUp4({super.key});

  @override
  State<SignUp4> createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.secondary,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SignUpInputs4(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.hintColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.hintColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.hintColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.accentWhite,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.hintColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 13,
                            width: 13,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorPallete.hintColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}