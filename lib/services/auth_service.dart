import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  /// Stream of auth changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Sign In
  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  /// Sign Up + profile creation
  Future<void> signUp({
    required String name,
    required DateTime dob,
    required String email,
    required String password,
    required File profileImage,
  }) async {
    // 1) Create user
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final uid = cred.user!.uid;

    // 2) Upload profile image
    final ref = _storage.ref().child('profile_pictures/$uid.jpg');
    await ref.putFile(profileImage);
    final photoUrl = await ref.getDownloadURL();

    // 3) Save extra fields in Firestore
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'dob': dob.toIso8601String(),
      'email': email,
      'photoUrl': photoUrl,
    });
  }

  /// Fetch additional profile (e.g. name) after login
  Future<DocumentSnapshot<Map<String, dynamic>>> getProfile(String uid) {
    return _firestore.collection('users').doc(uid).get();
  }

  /// Sign out
  Future<void> signOut() => _auth.signOut();
}
