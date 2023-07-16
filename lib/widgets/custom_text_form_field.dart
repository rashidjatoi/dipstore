import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Icon preIcon;
  final bool enabledTextField;
  final String? Function(String?)? validator;
  final Widget sufIcon;
  final TextEditingController textEditingController;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.preIcon,
      required this.sufIcon,
      this.enabledTextField = true,
      required this.validator,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 226, 224, 224),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 226, 224, 224),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color(0xff059669),
          ),
        ),
        hintText: hintText,
        iconColor: Colors.grey,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: "DMSans Regular",
        ),
        prefixIcon: preIcon,
        suffixIcon: sufIcon,
      ),
      enabled: enabledTextField,
      validator: validator,
    );
  }
}
