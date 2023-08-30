import 'package:sportify/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AgeTile extends StatelessWidget {
  final String age;
  final Color color;
  final Color fontColor;
  const AgeTile(
      {super.key,
        required this.age,
        required this.color,
        required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          age,
          style: TextStyle(color: fontColor, fontFamily: 'Lato'),
        ),
      ),
    );
  }
}
