import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseProvider {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseProvider({FirebaseAuth? auth, GoogleSignIn? google})
      : firebaseAuth = auth ?? FirebaseAuth.instance,
        googleSignIn = google ?? GoogleSignIn();

  User? get currentUser => firebaseAuth.currentUser;

  Future<void> signOut() async {
    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
  }
}
