import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user_model.dart';
import 'package:coffee/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositories {
  CollectionReference<UserModel> ref =
      FirebaseService.db.collection("users").withConverter<UserModel>(
            fromFirestore: (snapshot, _) {
              return UserModel.fromFirebaseSnapshot(snapshot);
            },
            toFirestore: (model, _) => model.toJson(),
          );

  Future<UserCredential> register(
      UserModel user, String email, String password) async {
    UserCredential auth = await FirebaseService.firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    user.userId = auth.user!.uid;
    ref.add(user);
    return auth;
  }
}
