import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final bool isLoading;

  const SignInButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? (){
        print('button pressed');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        elevation: 0,
      ),
      child: isLoading
          ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2.5,
        ),
      )
          : Text(
        buttonName,
        style: TextStyle(
            color: Color(0xFFE0F4FF),
            fontSize: 18,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
