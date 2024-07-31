import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/colors.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final double width, height, radius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? child;
  final Color? backgroundButtonColor;
  final Color textColor, borderColor;
  final void Function()? onTap;
  final bool withBorder;
  final Gradient? gradient;

  const ButtonWidget({
    super.key,
    this.title = "OK",
    this.width = 88.0,
    this.height = 56.0,
    this.onTap,
    this.child,
    this.fontSize,
    this.fontWeight,
    this.textColor = Colors.white,
    this.backgroundButtonColor,
    this.borderColor = borderMainColor,
    this.withBorder = false,
    this.radius = 8.0,
    this.gradient = const LinearGradient(
      colors: gradientButton,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
          backgroundColor: WidgetStateProperty.all<Color>(
              backgroundButtonColor ?? Colors.transparent),
          shadowColor: WidgetStateProperty.all<Color>(Colors.transparent),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: withBorder
                      ? BorderSide(color: borderColor)
                      : const BorderSide(color: Colors.transparent)))),
      onPressed: onTap,
      child: Ink(
        decoration: BoxDecoration(
          // color: inkColor,
          gradient: backgroundButtonColor == null ? gradient : null,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          constraints: BoxConstraints(minWidth: width, minHeight: height),
          // min sizes for Material buttons
          alignment: Alignment.center,
          child: child ??
              TextWidget(
                title: title,
                fontSize: fontSize ?? 18.sp,
                fontWeight: fontWeight ?? FontWeight.bold,
                textAlign: TextAlign.center,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
