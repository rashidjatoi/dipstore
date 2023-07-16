import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnText;
  final VoidCallback ontap;
  final Color btnTextColor;
  final Color btnColor;
  const CustomButton({
    super.key,
    required this.btnText,
    required this.ontap,
    this.btnTextColor = Colors.white,
    this.btnColor = const Color(0xff059669),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(btnColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: ontap,
        child: Text(
          btnText,
          style: TextStyle(
            color: btnTextColor,
            fontFamily: "DMSans Medium",
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
