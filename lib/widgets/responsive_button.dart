import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final Function() onTap;
  const ResponsiveButton({super.key, this.isResponsive=false, required this.width, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Try >>>>>')
            ],
          ),
        ),
      ),
    );
  }
}
