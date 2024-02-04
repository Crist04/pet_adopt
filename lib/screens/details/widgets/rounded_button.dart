import 'package:flutter/material.dart';

class RoundedIconTextButton extends StatelessWidget {
  const RoundedIconTextButton({
    Key? key,
    required this.buttonText,
    required this.backgroundColor,
    this.fontWeight,
    this.icon,
    this.onPressed,
  }) : super(key: key);
  final String buttonText;
  final Color backgroundColor;
  final FontWeight? fontWeight;
  final Widget? icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double?>(5),
        shadowColor: MaterialStateProperty.all<Color?>(Colors.white),
        shape: MaterialStateProperty.all<OutlinedBorder?>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0)),
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontSize: 20, fontWeight: fontWeight ?? FontWeight.bold)),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
      ),
      onPressed:onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon != null ? icon! : SizedBox(width: 0, height: 0),
          SizedBox(
            width: icon != null ? 15 : 0,
          ),
          Text(
            buttonText,
          ),
        ],
      ),
    );
  }
}
