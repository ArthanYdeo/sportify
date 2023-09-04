import 'package:flutter/material.dart';

class LogInHeader extends StatelessWidget {
  const LogInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320,
          height: 320,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sportify.PNG'),
            ),
          ),
        ),
        const Text(
          "LOGIN",
          style: TextStyle(
            fontFamily: 'RacingSansOne',
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.w900,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 3.0),
                blurRadius: 8.0,
                color: Color.fromARGB(255, 71, 71, 71),
              ),
            ],
          ),
        )
      ],
    );
  }
}
