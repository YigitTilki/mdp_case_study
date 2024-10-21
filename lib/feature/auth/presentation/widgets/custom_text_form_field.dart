import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.validator,
    this.focusNode,
    super.key,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      focusNode: focusNode,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(237, 241, 243, 1)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        contentPadding: EdgeInsets.all(5.sp),
      ),
    );
  }
}
