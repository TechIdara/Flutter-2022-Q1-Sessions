import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final GestureTapCallback onPress;

  const AppButton({required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xff5D5D67), width: 1),
                borderRadius: BorderRadius.circular(15)),
            child: GestureDetector(
              onTap: onPress,
              child: Text(label,
                  style: const TextStyle(
                      color: Color(0xFF191720),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}
