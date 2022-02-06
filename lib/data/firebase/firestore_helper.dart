import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musicapp/model/user.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  createUser(UserApp user) async {
    await firebaseFirestore.collection('users').doc(user.id).set(user.toMap());
  }
}
