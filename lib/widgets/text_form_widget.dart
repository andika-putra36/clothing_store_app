import 'package:flutter/material.dart';

class TextFormString extends StatelessWidget {
  final TextEditingController textController;
  final String? labelText;
  final bool? obscureText;

  const TextFormString({
    super.key,
    required this.textController,
    this.labelText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText ?? '',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: AppColor.border),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: AppColor.border, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
