import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final TextStyle? hintStyle;
  final EdgeInsets? contentPadding;
  final bool isObsecure;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool? autofocus;
  final Color? fillColor;
  final Widget? suffixIcon;
  const CustomTextForm({
    required this.controller,
    super.key,
    required this.hint,
    required this.isObsecure,
    required this.validator,
    this.hintStyle,
    this.onSaved,
    this.suffixIcon,
    this.autofocus,
    this.fillColor,
    this.contentPadding,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  late bool secure;

  @override
  void initState() {
    super.initState();
    secure = widget.isObsecure;
  }

  void changeObscure() {
    setState(() {
      secure = !secure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus ?? false,
      onSaved: widget.onSaved,

      validator: widget.validator,
      obscureText: secure,
      controller: widget.controller,
      decoration: InputDecoration(
        hintStyle: widget.hintStyle ?? AppTextStyle.font14BlackLight,
        hintText: widget.hint,
        isDense: true,
        suffixIcon: widget.isObsecure
            ? IconButton(
                onPressed: changeObscure,
                icon: secure
                    ? Icon(
                        Icons.visibility_off_outlined,
                        color: AppColors.orangeBase,
                      )
                    : Icon(
                        Icons.visibility_outlined,
                        color: AppColors.orangeBase,
                      ),
              )
            : widget.suffixIcon,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        filled: true,
        fillColor: widget.fillColor ?? AppColors.yellowTwo,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
