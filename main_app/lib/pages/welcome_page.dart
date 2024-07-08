import 'package:flutter/material.dart';
import '../design/welcome_signup_login/BG_w.dart';
import '../design/welcome_signup_login/buttonauth.dart';
import '../design/welcome_signup_login/logo_M3_CODE.dart';
import '../design/welcome_signup_login/logo_UD.dart';
import '../generated/l10n.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const BG_w(),
          Column(
            children: [
              const Expanded(flex: 4, child: SizedBox()),
              Expanded(
                  flex: 7,
                  child: SizedBox(
                      child: Container(
                    height: 240,
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 40.0,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: '${S.of(context).welcome}\n',
                              style: const TextStyle(
                                fontSize: 45.0,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: '\n${S.of(context).welcometext}',
                              style: const TextStyle(
                                fontSize: 20,
                                // height: 0,
                              ))
                        ],
                      ),
                    ),
                  )))
            ],
          ),
          const Logo_UD(),
          Column(
            children: [
              const SizedBox(
                height: 520,
              ),
              ButtonAtuh(
                title: " ${S.of(context).login} ",
                horizontal: 132,
                colorbackround: const Color(0xFFE0E0E0),
                colorfont: const Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
              ),
              const SizedBox(
                height: 22,
              ),
              ButtonAtuh(
                title: S.of(context).signup,
                horizontal: 130,
                colorbackround: const Color(0xFFE0E0E0),
                colorfont: const Color(0xFF303030),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],
          ),
          const Logo_M3_CODE_1(path: "images/ylogo.png")
        ],
      ),
    );
  }
}
