import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Pill extends StatelessWidget {
  final Color color;
  final double size;
  const Pill({Key key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      child: Container(
        width: size ?? 33,
        height: size ?? 33,
        child: FittedBox(
          child: SvgPicture.asset(
            svgPath("pill"),
            color: color,
          ),
        ),
      ),
    );
  }
}