import 'package:cityapp/auth/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  //final List<UserModel> firebaseUser = [];

  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> fillUser() async {
    final user = await FirebaseAuth.instance.currentUser;
    UserModel item = UserModel(
      name: user!.displayName!,
      email: user.email!,
    );

    Map<String, dynamic> itemJson = item.toJson();
    return itemJson.toString();
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}
