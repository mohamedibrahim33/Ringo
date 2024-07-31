import 'package:flutter/material.dart';
import 'package:flutter_dev_test/core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText, label, errorText;
  final TextInputType type;
  final bool password;
  final bool expanded;
  final Color activeBorderColor, borderColor, backgroundColor;
  final bool floatingHint;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final TextAlign textalign;
  final int? maxLengh;
  final TextDirection? textdirection;
  final EdgeInsetsDirectional? contentPadding;
  final double borderRadius;
  final Widget? prefixIcon, suffixIcon, suffixWidget, prefixWidget;
  final TextEditingController? controller;
  final InputDecoration? inputDecoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final String? Function(String?)? validator;
  final bool? readOnly;

  const CustomTextFormField(
      {this.onChanged,
      this.onSaved,
      this.validator,
      this.onTap,
      this.password = false,
      this.expanded = false,
      this.floatingHint = true,
      this.type = TextInputType.text,
      this.hintText = "",
      this.label,
      this.textalign = TextAlign.start,
      this.maxLengh,
      this.errorText,
      this.controller,
      this.activeBorderColor = primaryColor,
      this.borderRadius = 22.0,
      this.borderColor = secondaryColor,
      this.backgroundColor = Colors.transparent,
      this.maxLines = 1,
      this.minLines = 1,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixWidget,
      this.prefixWidget,
      this.inputDecoration,
      this.contentPadding,
      this.textdirection,
      super.key,
      this.readOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLengh,
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly ?? false,
      minLines: minLines,
      autofocus: !floatingHint,
      expands: expanded,
      textAlign: textalign,
      textDirection: textdirection,
      decoration: inputDecoration ??
          InputDecoration(
            contentPadding:
                contentPadding ?? EdgeInsets.symmetric(vertical: 8.w),
            filled: true,
            fillColor: backgroundColor,
            prefixIcon: prefixIcon,
            suffix: suffixWidget,
            prefix: prefixWidget,
            suffixIcon: suffixIcon,
            errorText: errorText,
            labelText: label,

            // label: TextWidget(title: label,),
            // label: TextWidget(title: label,color: secondaryColor,),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: activeBorderColor, width: 1.5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor, width: 1.0),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            errorMaxLines: 3,
            isDense: true,
            labelStyle: const TextStyle(color: secondaryColor),
            hintStyle: const TextStyle(color: secondaryColor),
            hintText: hintText,
          ),
      keyboardType: type,
      obscureText: password,
      obscuringCharacter: '*',
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      style: TextStyle(
          fontSize: 16.sp, color: primaryColor, fontWeight: FontWeight.w600),
    );
  }
}
