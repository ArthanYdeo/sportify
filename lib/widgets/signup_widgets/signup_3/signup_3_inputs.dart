import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sportify/constant/strings.dart';
import 'package:sportify/pages/login.dart';
import '../../../constant/colors.dart';
import '../../../dialogs/dialog_unsuccessful.dart';
import '../../signup_header.dart';


class SignUpInputs3 extends StatefulWidget {
  const SignUpInputs3({super.key});

  @override
  State<SignUpInputs3> createState() => _SignUpInputs3State();
}

class _SignUpInputs3State extends State<SignUpInputs3> {
  final _signUpBox = Hive.box('signUpBox');
  String? sexValue;

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
            const SignUpHeader(manSpeaking: "What is your gender?"),
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: ColorPallete.accentWhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 2.0,
                    offset: Offset(0, 2),
                    color: Color(0xff505050),
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: DropdownButtonFormField(
                dropdownColor: ColorPallete.accentWhite,
                hint: const Text(
                  "GENDER",
                  style: TextStyle(
                    color: ColorPallete.hintColor,
                    fontFamily: 'Lato',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                value: sexValue,
                isExpanded: true,
                iconSize: 32,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: ColorPallete.hintColor,
                ),
                items: SportifyStrings.sex.map(buildMenuItemSex).toList(),
                onChanged: ((sexValue) => setState(() {
                  this.sexValue = sexValue ?? "";
                })),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
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
                    if (sexValue == null) {
                      DialogUnsuccessful(
                          headertext: "Input required!",
                          subtext: "Please input your gender!",
                          textButton: "Close",
                          callback: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          }).buildUnsuccessfulScreen(context);
                      return;
                    }
                    String sex = sexValue.toString();
                    _signUpBox.put("gender", sex);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  });
                },
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 50,
                  color:  ColorPallete.accentWhite,
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

