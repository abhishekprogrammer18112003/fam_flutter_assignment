import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final String text;
  final String bgColor;
  final bool isCircular;
  final bool isSecondary;
  final double strokeWidth;

  const CTAButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.isCircular,
    required this.isSecondary,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(int.parse('0xff${bgColor.substring(1)}')),
        foregroundColor: isSecondary ? Colors.black : Colors.white,
        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(
                  color: isSecondary ? Colors.black : Colors.transparent,
                  width: strokeWidth,
                ),
              ),
        padding: isCircular
            ? const EdgeInsets.all(16.0)
            : const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      ),
      onPressed: () {
        // Define button action here
        debugPrint("CTA Button Pressed: $text");
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
