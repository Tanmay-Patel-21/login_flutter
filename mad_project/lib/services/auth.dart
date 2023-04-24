import 'package:firebase_auth/firebase_auth.dart';
import 'package:mad_project/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create user obj based on FirebaseUser
  // CustomUser? _userFromFirebaseUser(User? user) {
  //   return user != null ? CustomUser(uid: user.uid) : CustomUser(uid: '');
  // }

  // auth change user stream
  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // Sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error signing out");
    }
  }

  // Sign in with email and password
  Future logInWithPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      print(user);
      return user;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
  // Register with email and password

  // Logout
}
