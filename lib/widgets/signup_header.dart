import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sportify/constant/colors.dart';

class SignUpHeader extends StatefulWidget {
  final String manSpeaking;
  const SignUpHeader({super.key, required this.manSpeaking});

  @override
  State<SignUpHeader> createState() => _SignUpHeaderState();
}

class _SignUpHeaderState extends State<SignUpHeader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            width: 250,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0x7F0B666A), Color(0xFF0084FF)],
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ]),
            child: Center(
              child: Text(
                widget.manSpeaking,
                style: const TextStyle(
                  color: ColorPallete.accentWhite,
                  fontFamily: 'Lato',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 70,
            left: -20,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/manicon.PNG'),
            ),
          ),
        ],
      ),
    );
  }
}
