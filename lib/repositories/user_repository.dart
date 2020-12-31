import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<User> signUpUserWithEmailPass(String email, String pass) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return authResult.user;
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<User> signInUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> isSignedIn() async {
    var currentUser = await firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<User> getCurrentUser() async {
    return await firebaseAuth.currentUser;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
