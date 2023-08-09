import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgrouncolor;
  final double size;
  final Color bordercolor;
  final Widget w;
  const AppButton(
      {super.key,
      required this.color,
      required this.backgrouncolor,
      required this.bordercolor,
      required this.size,
      required this.w});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgrouncolor,
          border: Border.all(color: bordercolor, width: 1)),
      child: Center(
        child: w,
      ),
    );
  }
}
