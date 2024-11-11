import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  // Get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }


  // Sign in
  Future<UserCredential> signInWithEmailPass(String email, password) async{
  // Try sign user in
    try {
      UserCredential userCredential = 
        await _firebaseAuth.signInWithEmailAndPassword(
          email: email, 
          password: password,
          );

      return userCredential;
    }
    // Catch any errors
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }


  }


  // Sign up
  Future<UserCredential> signUpWithEmailPass(String email, password) async{
  // Try sign user up
    try {
      UserCredential userCredential = 
        await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, 
          password: password,
          );

      return userCredential;
    }
    // Catch any errors
    on FirebaseAuthException catch (e){
      throw Exception(e.code);
    }


  }

  // Sign out
  Future<void> signOut() async{
    return await _firebaseAuth.signOut();
  }

}