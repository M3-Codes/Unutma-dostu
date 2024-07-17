import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'iuser_manager.dart';

class UserManager implements IUserManager {
  @override
  String clientName() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return user.email!;
    } else {
      log("User not found!!!!");
    }
    return "MyDate";
  }
}
