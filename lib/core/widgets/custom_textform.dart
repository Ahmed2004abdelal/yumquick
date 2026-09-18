import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yumquick/core/theme/app_colors.dart';
import 'package:yumquick/core/theme/app_text_style.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isObsecure;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;
  bool? autofocus;
  CustomTextForm({
    required this.controller,
    super.key,
    required this.hint,
    required this.isObsecure,
    required this.validator,
    this.onSaved,
    this.autofocus,
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
        hintText: widget.hint,
        isDense: true,
        // constraints: BoxConstraints(minHeight: 45.h, maxHeight: 45.h),
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
            : null,
        // contentPadding: EdgeInsetsDirectional.only(
        filled: true,
        fillColor: AppColors.yellowTwo,
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
