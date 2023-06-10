import 'package:cloud_firestore/cloud_firestore.dart';

class SKCK {
  String userid;
  String dataid;
  String nama;
  String imageFace;
  String imagektp;
  String status;
  String catatan;
  DateTime createdAt;

  SKCK({
    required this.userid,
    required this.dataid,
    required this.nama,
    required this.imageFace,
    required this.imagektp,
    required this.status,
    required this.catatan,
    required this.createdAt,
  });

  static SKCK fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return SKCK(
      userid: snapshot['userid'],
      dataid: snapshot['dataid'],
      nama: snapshot['nama'],
      imageFace: snapshot['imageFace'],
      imagektp: snapshot['imagektp'],
      status: snapshot['status'],
      catatan: snapshot['catatan'],
      createdAt: snapshot['createdAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "dataid": dataid,
        "nama": nama,
        "imageFace": imageFace,
        "imagektp": imagektp,
        "status": status,
        "catatan": catatan,
        "createdAt": createdAt,
      };
}
