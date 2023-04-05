import 'package:flutter/material.dart';
// import 'package:makeat_fe/views/social_login_screen.dart';

class CustomLoginButton extends StatelessWidget {
  final String buttonText1;
  final String buttonText2;
  // final VoidCallback onTap;
  final String imageURL;
  final Color buttonColor;

  const CustomLoginButton({super.key, 
    required this.buttonText1,
    required this.buttonText2,
    // required this.onTap,
    required this.imageURL,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => { onTap },
      child: Container(
        width: 300.0,
        height: 44.0,
        color: buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageURL,
              height: 44.0,
            ),
            Text(
              buttonText1,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
            ),
            Text(
              buttonText2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
          ],
        )
      ),
    );
  }
}