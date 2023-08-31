import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sportify/constant/colors.dart';
import 'package:sportify/pages/signUp/signUp5.dart';
import '../../../dialogs/dialog_unsuccessful.dart';
import '../../signup_header.dart';


class SignUpInputs4 extends StatefulWidget {
  const SignUpInputs4({super.key});

  @override
  State<SignUpInputs4> createState() => _SignUpInputs4State();
}

class _SignUpInputs4State extends State<SignUpInputs4> {
  final _signUpBox = Hive.box('signUpBox');
  final _inputControllerMobileNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF0E777C), Color(0xFF87A0F1)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        child: Column(
          children: [
            const SignUpHeader(manSpeaking: "What is your Mobile Number?"),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        blurRadius: 2.0,
                        offset: Offset(0, 2),
                        color: Color(0xff505050),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextFormField(
                    controller: _inputControllerMobileNumber,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: ColorPallete.accentWhite,
                      hintText: "MOBILE NUMBER",
                      hintStyle: const TextStyle(
                        color: ColorPallete.hintColor,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                    ),
                    style: const TextStyle(
                      color: ColorPallete.accentBlack,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0x7F0B666A),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    String mobileNumber = _inputControllerMobileNumber.text.trim();
                    if (mobileNumber .isEmpty) {
                      DialogUnsuccessful(
                        headertext: "Input required!",
                        subtext: "Please input your mobile number!",
                        textButton: "Close",
                        callback: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ).buildUnsuccessfulScreen(context);
                      return;
                    }
                    //String sex = sexValue.toString();

                    _signUpBox.put("mobileNumber,", mobileNumber);
                    //_signUp1Box.put("sex", sex);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp5(),
                        ));
                  });
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 50,
                  color: ColorPallete.accentWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItemSex(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
        fontFamily: 'Lato',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: ColorPallete.primary,
      ),
    ),
  );
}
