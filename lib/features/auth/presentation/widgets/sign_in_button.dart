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
    return SizedBox(
      height: 50,
      child: ElevatedButton(
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
        child:isLoading
            ?CircularProgressIndicator()
            : Text(
          buttonName,
          style: TextStyle(
              color: Color(0xFFE0F4FF),
              fontSize: 18,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
