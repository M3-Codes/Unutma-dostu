import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../home/custom_dialog.dart';
import 'DrawerMenuItem.dart';
import 'FirebaseProvider .dart';
import 'LanguageButton.dart';

class DrawerMenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerMenuItem(
          icon: Icons.translate_rounded,
          text: S.of(context).language,
          onTap: () => _showLanguageDialog(context),
        ),
        DrawerMenuItem(
          icon: Icons.videocam,
          text: S.of(context).Demo,
          onTap: () => CustomDialog.showCustomDialog(context),
        ),
        DrawerMenuItem(
          icon: Icons.logout_rounded,
          text: S.of(context).signout,
          onTap: () async {
            final firebaseProvider =
                Provider.of<FirebaseProvider>(context, listen: false);
            await firebaseProvider.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/welcome', (route) => false);
          },
        ),
        DrawerMenuItem(
          icon: Icons.info_outline,
          text: S.of(context).about,
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AboutDialog();
              },
            );
          },
        ),
      ],
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).selectlan),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LanguageButton(locale: Locale('en'), language: 'English'),
              LanguageButton(locale: Locale('tr'), language: 'Türkçe'),
              LanguageButton(locale: Locale('ar'), language: 'العربية'),
            ],
          ),
        );
      },
    );
  }
}
