import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userid;
  String dataid;
  String nama;
  String umur;
  String imageFace;
  String imagekk;
  String imagettd;
  DateTime createdAt;

  User({
    required this.userid,
    required this.dataid,
    required this.nama,
    required this.umur,
    required this.imageFace,
    required this.imagekk,
    required this.imagettd,
    required this.createdAt,
  });

  static User fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      userid: snapshot['userid'],
      dataid: snapshot['dataid'],
      nama: snapshot['nama'],
      umur: snapshot['umur'],
      imageFace: snapshot['imageFace'],
      imagekk: snapshot['imagekk'],
      imagettd: snapshot['imagettd'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "data": dataid,
        "nama": nama,
        "umur": umur,
        "imageFace": imageFace,
        "imagekk": imagekk,
        "imagettd": imagettd,
        "createdAt": createdAt,
      };
}
