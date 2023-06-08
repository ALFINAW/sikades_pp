import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userid;
  String dataid;
  String nama;
  String imageFace;
  String imagektp;
  DateTime createdAt;

  User({
    required this.userid,
    required this.dataid,
    required this.nama,
    required this.imageFace,
    required this.imagektp,
    required this.createdAt,
  });

  static User fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      userid: snapshot['userid'],
      dataid: snapshot['dataid'],
      nama: snapshot['nama'],
      imageFace: snapshot['imageFace'],
      imagektp: snapshot['imagektp'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "data": dataid,
        "nama": nama,
        "imageFace": imageFace,
        "imagektp": imagektp,
        "createdAt": createdAt,
      };
}
