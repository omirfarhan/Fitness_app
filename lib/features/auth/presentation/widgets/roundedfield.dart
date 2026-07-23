import 'package:flutter/material.dart';

class Roundedfield extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool obscureText;
  final Widget? suffixIcon;

  const Roundedfield({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.obscureText,
    this.suffixIcon
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          isDense: true,
          hintText: hint,
          prefixIcon: Icon(icon, color: Colors.grey),
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: const Color(0xFFF2F3F7),
          contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 12,
        ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
        )
      ),
    );
  }
}
