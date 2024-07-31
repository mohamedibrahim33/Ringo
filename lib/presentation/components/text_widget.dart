import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isOffer;
  final TextDirection? textDirection;
  final bool underLine;
  final Color? underLineColor;

  // ignore: use_key_in_widget_constructors
  const TextWidget({
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.maxLines = 2,
    this.color,
    this.textAlign,
    this.isOffer = false,
    this.textDirection,
    this.underLine = false,
    this.underLineColor,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      maxLines: maxLines,
      overflow: maxLines == null ? null : TextOverflow.ellipsis,
      textDirection: textDirection,
      style: TextStyle(
        fontSize: fontSize?.sp ?? 14.sp,
        fontWeight: fontWeight,
        decoration: isOffer
            ? TextDecoration.lineThrough
            : underLine
                ? TextDecoration.underline
                : null,
        decorationColor: underLineColor ?? secondaryColor,
        decorationThickness: 2,
        height: 1.2,
        color: color ?? Theme.of(context).textTheme.bodyLarge!.color,
      ),
      textAlign: textAlign,
    );
  }
}
