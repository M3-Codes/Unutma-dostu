import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 8,
        child: Container(
          height: 240,
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 40.0,
          ),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                    text: 'Welcome Back!\n',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w600,
                    )),
                TextSpan(
                    text: '\nEnter personal details to your employee account',
                    style: TextStyle(
                      fontSize: 20,
                      // height: 0,
                    ))
              ],
            ),
          ),
        ));
  }
}
