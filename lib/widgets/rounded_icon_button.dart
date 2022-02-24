import 'package:flutter/material.dart';
import '../config/palette.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  final Color iconColor;
  final Color rippleColor;
  final double height;
  final double width;
  final double iconSize;

  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Palette.blackColor,
    this.rippleColor = Palette.facebookBlue,
    this.height = 50,
    this.width = 45,
    this.iconSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: Palette.lightGreyColor,
        shape: BoxShape.circle,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: rippleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
