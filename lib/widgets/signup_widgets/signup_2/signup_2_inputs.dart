import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sportify/constant/colors.dart';
import 'package:sportify/constant/strings.dart';

import '../../../dialogs/dialog_unsuccessful.dart';
import '../../../pages/signUp/signUp3.dart';
import '../../age_tile.dart';
import '../../signup_header.dart';



class SignUpInputs2 extends StatefulWidget {
  const SignUpInputs2({super.key});

  @override
  State<SignUpInputs2> createState() => _SignUpInputs2State();
}

class _SignUpInputs2State extends State<SignUpInputs2> {
  final FixedExtentScrollController myScroll = FixedExtentScrollController();
  final _signUpBox = Hive.box('signUpBox');
  int selectedItemIndex = 18;
  String age = "18";
  final _formKey = GlobalKey<FormState>();
  final _inputControllerAge = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(initListData);
    _inputControllerAge.text = "21";
  }

  initListData(_) async {
    myScroll.jumpToItem(3);
  }

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
              const SignUpHeader(manSpeaking: "What is your age?"),
              Column(
                children: [
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
                          onChanged: (value) => setState(() {
                            myScroll.animateToItem(
                                int.parse(
                                    value.isNotEmpty ? value : 0.toString()) -
                                    18,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                          }),
                          maxLength: 2,
                          controller: _inputControllerAge,
                          keyboardType: TextInputType.number,
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
                            hintText: "AGE",
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: ListWheelScrollView.useDelegate(
                      controller: myScroll,
                      onSelectedItemChanged: (value) => setState(() {
                        value += 18;
                        selectedItemIndex = value;
                        debugPrint(selectedItemIndex.toString());
                        if (_inputControllerAge.text.isNotEmpty) {
                          if (!(int.parse(_inputControllerAge.text) < 18)) {
                            TextSelection previousSelection =
                                _inputControllerAge.selection;
                            _inputControllerAge.text = value.toString();
                            _inputControllerAge.selection = previousSelection;
                          } else if ((int.parse(_inputControllerAge.text) <=
                              10)) {
                            // Prevents one digit number to making it 18
                          } else if ((int.parse(_inputControllerAge.text) <=
                              17)) {
                            TextSelection previousSelection =
                                _inputControllerAge.selection;
                            _inputControllerAge.text = value.toString();
                            _inputControllerAge.selection = previousSelection;
                          }
                        } else {
                          TextSelection previousSelection =
                              _inputControllerAge.selection;
                          _inputControllerAge.text = value.toString();
                          _inputControllerAge.selection = previousSelection;
                        }
                      }),
                      itemExtent: 50,
                      childDelegate: ListWheelChildBuilderDelegate(
                        childCount: SportifyStrings.ages.length,
                        builder: (context, index) {
                          return AgeTile(
                              fontColor: ColorPallete.accentWhite,
                              color: index + 18 == selectedItemIndex
                                  ? ColorPallete.secondary
                                  : ColorPallete.primary,
                              age: SportifyStrings.ages[index]);
                        },
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
                          String age = _inputControllerAge.text.trim();
                          if (age.isEmpty) {
                            DialogUnsuccessful(
                                headertext: "Input required!",
                                subtext: "Please input your age!",
                                textButton: "Close",
                                callback: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                }).buildUnsuccessfulScreen(context);
                            return;
                          } else if (int.parse(age) <= 17) {
                            DialogUnsuccessful(
                                headertext: "Under age!",
                                subtext: "Sorry you have to be 18 and above.",
                                textButton: "Close",
                                callback: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                }).buildUnsuccessfulScreen(context);
                            return;
                          }
                          _signUpBox.put("age", age);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUp3(),
                            ),
                          );
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
            ],
          ),
        ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myScroll.dispose();
    _inputControllerAge.dispose();
  }
}

