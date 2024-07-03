import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictok_clone/screens/authentication/models/user_profile_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

//create profile
  Future<void> createProfile(UserProfileModel user) async {
    await _db.collection("users").doc(user.uid).set(user.toJson());
  }
//get profile
}

final userRepo = Provider((ref) => UserRepository());
