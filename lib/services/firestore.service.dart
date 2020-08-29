import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ukwenza/models/index.dart';

class FirestoreService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      await _usersCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      print(e.toString());
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollection.doc(uid).get();
      return User.fromJson(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}
