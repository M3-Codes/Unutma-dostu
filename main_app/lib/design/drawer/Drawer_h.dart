import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../generated/l10n.dart';
import '../home/custom_dialog.dart';
import '../welcome_signup_login/BG_w.dart';
import '../welcome_signup_login/logo_M3_CODE.dart';
import 'AboutDialogContent.dart';
import 'DrawerOption.dart';
import 'LanguageSelectionDialog.dart';
import 'UserInfoCard.dart';

class Drawer_h extends StatefulWidget {
  const Drawer_h({super.key});

  @override
  State<Drawer_h> createState() => _Drawer_hState();
}

class _Drawer_hState extends State<Drawer_h> {
  final cuser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
                UserInfoCard(user: cuser),
                const SizedBox(height: 70),
                DrawerOption(
                  icon: Icons.translate_rounded,
                  title: S.of(context).language,
                  onTap: () => _showLanguageDialog(context),
                ),
                const SizedBox(height: 12),
                DrawerOption(
                  icon: Icons.videocam,
                  title: S.of(context).Demo,
                  onTap: () => CustomDialog.showCustomDialog(context),
                ),
                const SizedBox(height: 12),
                DrawerOption(
                  icon: Icons.logout_rounded,
                  title: S.of(context).signout,
                  onTap: () => _signOut(context),
                ),
                const SizedBox(height: 12),
                DrawerOption(
                  icon: Icons.info_outline,
                  title: S.of(context).about,
                  onTap: () => _showAboutDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LanguageSelectionDialog();
      },
    );
  }

  void _signOut(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/welcome', (route) => false);
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AboutDialogContent();
      },
    );
  }
}
