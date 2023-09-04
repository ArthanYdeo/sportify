import 'package:flutter/material.dart';
import 'package:sportify/constant/colors.dart';

import '../../dialogs/dialog_loading.dart';
import '../../dialogs/dialog_unsuccessful.dart';
import '../../home.dart';
import '../../pages/signUp/signUp.dart';

class LogInInputs extends StatefulWidget {
  const LogInInputs({super.key});

  @override
  State<LogInInputs> createState() => _LogInInputsState();
}

class _LogInInputsState extends State<LogInInputs> {
  bool _showPassword = true;
  final _inputControllerUserEmail = TextEditingController();
  final _inputControllerPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _inputControllerUserEmail.dispose();
    _inputControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: _inputControllerUserEmail,
                validator: (value) {
                  // Email RegEx Validation
                  final bool emailValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value.isNotEmpty && emailValid) {
                    return null;
                  } else {
                    return "Invalid email address.";
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  counterText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorStyle: const TextStyle(
                    color: ColorPallete.accentWhite,
                  ),
                  filled: true,
                  fillColor: ColorPallete.accentWhite,
                  hintText: "EMAIL",
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
                  color: ColorPallete.secondary,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: _inputControllerPassword,
                obscureText: !_showPassword,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter your password.";
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorStyle: const TextStyle(
                    color: ColorPallete.accentWhite,
                  ),
                  suffixIconColor: ColorPallete.hintColor,
                  suffixIcon: GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: _showPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  filled: true,
                  fillColor: ColorPallete.accentWhite,
                  hintText: "*********",
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
                  color: ColorPallete.secondary,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                  return;
                  }
                  DialogLoading(subtext: "Logging in.")
                      .buildLoadingScreen(context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const Home()),
                          (Route<dynamic> route) => false);
                },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ColorPallete.accentBlack,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: ColorPallete.accentWhite,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "or",
                style: TextStyle(
                  color: ColorPallete.accentWhite,
                  fontFamily: 'Lato',
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Go to the signup
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      ColorPallete.accentBlack
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  child: const Text(
                    "SIGN UP!",
                    style: TextStyle(
                      color: ColorPallete.accentWhite,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}

