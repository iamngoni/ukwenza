import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:ukwenza/models/index.dart';
import 'package:ukwenza/services/index.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final _firestoreService = new FirestoreService();

  Future signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.User user = result.user;
      return _firestoreService.getUser(user.uid);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPassword({
    @required String name,
    @required String surname,
    @required String email,
    @required String password,
  }) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      auth.User user = result.user;
      await _firestoreService.createUser(
        User(
          id: user.uid,
          email: email,
          name: name,
          surname: surname,
        ),
      );
      return _firestoreService.getUser(user.uid);
    } catch (e) {
      print(e.toString());
    }
  }

  Future resetPassword({@required String email}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString);
    }
  }
}
