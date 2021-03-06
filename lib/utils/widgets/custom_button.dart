import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool expanded;
  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Color textColor;
  final EdgeInsets padding;
  final bool Function() validator;
  final double width;

  const CustomButton({
    Key key,
    this.expanded = false,
    @required this.text,
    this.color,
    @required this.onPressed,
    this.textColor,
    this.padding,
    this.validator,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? (expanded ? double.maxFinite : null),
      child: ElevatedButton(
        onPressed: (validator == null ? true : validator()) ? onPressed : null,
        child: Text(
          "$text",
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            letterSpacing: 0.5,
          ),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            padding ?? EdgeInsets.symmetric(horizontal: 30, vertical: 17),
          ),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: (validator == null ? true : validator())
              ? MaterialStateProperty.all(color ?? buttonColor)
              : MaterialStateProperty.all(
                  (color ?? buttonColor).withOpacity(0.5)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(330),
            ),
          ),
        ),
      ),
    );
  }
}
