import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color? fillColor;
  final double? size;

  const SvgIcon({
    super.key,
    required this.icon,
    this.fillColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    var child = SvgPicture.asset(icon, color: fillColor);
    if (size != null) {
      return SizedBox(
        width: size,
        height: size,
        child: child,
      );
    }
    return child;
  }
}
