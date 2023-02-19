import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  String uid;
  String name;
  List<String> allergies;
  UserInfo({required this.uid, required this.name, required this.allergies});

// ignore: empty_constructor_bodies
  static UserInfo fromFirestore(DocumentSnapshot snap) {
    Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
    return UserInfo(
      uid: snap.id,
      name: data['name'],
      allergies: data['allergies'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": uid, "owner": name, "allergies": allergies};
  }
}
