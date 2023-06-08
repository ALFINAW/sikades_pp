import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Signup Method
  Future<String> register({
    required username,
    required email,
    required password,
    required nik,
  }) async {
    String res = 'Some error occurred';

    try {
      // DateTime dateTime = DateTime.now();

      // String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          nik.isNotEmpty) {
        // Register user
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Add user to DB
        String uid = credential.user!.uid;
        final user = model.User(
          userid: uid,
          uName: username,
          email: email,
          nik: nik,
          role: "user",
          createdAt: DateTime.now(),
        );
        _firestore.collection('users').doc(uid).set(user.toJson());

        res = 'Success';
      } else {
        res = 'Please enter all the field';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  /// Login Method
  Future<String> login({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Success';
      } else {
        res = 'Please enter all the field';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
