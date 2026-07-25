import 'package:flutter/material.dart';

class Socialbutton extends StatelessWidget {

  final Widget icon;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  const Socialbutton({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: onTap,
        icon:icon,
        label: Text(
          label,
          style: const TextStyle(color: Colors.black87),
        ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFE0E0E0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      ),
    );
  }
}
