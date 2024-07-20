import 'package:cloud_firestore/cloud_firestore.dart';

class Profiledatamodel {
  final String username;
  final String email;
  final String uid;

  Profiledatamodel(
      {required this.username, required this.email, required this.uid});

  Map<String, dynamic> tojson() =>
      {"username": username, "email": email, "uid": uid};

  static Profiledatamodel fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Profiledatamodel(
        username: snapshot["username"],
        email: snapshot["email"],
        uid: snapshot["uid"]);
  }
}
