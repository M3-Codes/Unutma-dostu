import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../welcome_signup_login/BG_w.dart';
import '../welcome_signup_login/logo_M3_CODE.dart';
import 'DrawerMenuItems.dart';
import 'FirebaseProvider .dart';
import 'UserInformation.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    final currentUser = firebaseProvider.currentUser;

    return Drawer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const BG_w(),
          const Logo_M3_CODE_1(path: "images/ylogo.png"),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                UserInformation(currentUser: currentUser),
                const SizedBox(height: 70),
                DrawerMenuItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
