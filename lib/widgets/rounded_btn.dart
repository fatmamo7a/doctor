import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? pressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool load;
  final double? fontSize;
  const CustomRoundedButton(
      {super.key,
      this.pressed,
      required this.text,
      this.backgroundColor,
      this.borderColor,
      this.textColor,
      this.fontSize,
      this.load = false});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: pressed,
      child: load
          ? Wrap(
              alignment: WrapAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.red[200],
                )
              ],
            )
          : Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.red[200],
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: borderColor ?? Colors.transparent,
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w800,
                  fontSize: fontSize,
                ),
              ),
            ),
    );
  }
}
