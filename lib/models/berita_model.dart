import 'package:cloud_firestore/cloud_firestore.dart';

class Berita {
  String beritaId;
  String judul;
  String deskripsi;
  String imageUrl;
  String tanggal;

  Berita(
      {required this.beritaId,
      required this.judul,
      required this.deskripsi,
      required this.imageUrl,
      required this.tanggal});

  static Berita fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Berita(
      beritaId: snapshot['beritaId'],
      judul: snapshot['judul'],
      deskripsi: snapshot['deskripsi'],
      imageUrl: snapshot['imageUrl'],
      tanggal: snapshot['tanggal'],
    );
  }

  Map<String, dynamic> toJson() => {
        "beritaId": beritaId,
        "judul": judul,
        "deskripsi": deskripsi,
        "imageUrl": imageUrl,
        "tanggal": tanggal
      };
}
