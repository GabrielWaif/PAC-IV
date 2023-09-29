import 'package:box_ui/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

class BoxInputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? trailingTapped;
  final bool password;

  final circularBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
  );

  BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.leading,
    this.trailing,
    this.trailingTapped,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(height: 1),
      obscureText: password,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        filled: true,
        fillColor: const Color.fromARGB(255, 179, 182, 184),
        prefixIcon: leading,
        suffixIcon: trailing != null ? GestureDetector(child: trailing,onTap: trailingTapped,) : null,
        border: circularBorder.copyWith(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 179, 182, 184))),
        errorBorder:
            circularBorder.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: circularBorder.copyWith(
            borderSide: BorderSide(color: primaryColor)),
        enabledBorder: circularBorder.copyWith(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 179, 182, 184))),
      ),
    );
  }
}
