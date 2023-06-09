import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sikades/models/berita_model.dart';
import 'package:sikades/models/ktp_model.dart';

class FirestoreMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  //add berita
  Future<String> tambahBerita(
      String judul, String deskripsi, String imageUrl) async {
    String res = "Some error occurred";
    DateTime dateTime = DateTime.now();

    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    try {
      final col = _firestore.collection('berita');
      final doc = col.doc();
      Berita aduan = Berita(
          beritaId: doc.id,
          judul: judul,
          deskripsi: deskripsi,
          imageUrl: imageUrl,
          tanggal: formattedDate);
      _firestore.collection('berita').doc(doc.id).set(aduan.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //add berita
  Future<String> tambahDataKtp(String nama, String umur, String imageFaceUrl,
      String imageKkUrl, String imageTtdUrl) async {
    String res = "Some error occurred";
    DateTime dateTime = DateTime.now();

    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);
    try {
      final col = _firestore.collection('data_ktp');
      final doc = col.doc();
      KTP aduan = KTP(
          userid: uid,
          dataid: doc.id,
          nama: nama,
          umur: umur,
          imageFace: imageFaceUrl,
          imagekk: imageKkUrl,
          imagettd: imageTtdUrl,
          status: "",
          createdAt: DateTime.now());
      _firestore.collection('data_ktp').doc(doc.id).set(aduan.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
