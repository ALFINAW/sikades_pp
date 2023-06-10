import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:sikades/models/berita_model.dart';
import 'package:sikades/models/ktp_model.dart';
import 'package:sikades/models/skck_model.dart';

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
      Berita berita = Berita(
          beritaId: doc.id,
          judul: judul,
          deskripsi: deskripsi,
          imageUrl: imageUrl,
          tanggal: formattedDate);
      _firestore.collection('berita').doc(doc.id).set(berita.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //add KTP
  Future<String> tambahDataKtp(String nama, String umur, String imageFaceUrl,
      String imageKkUrl, String imageTtdUrl) async {
    String res = "Some error occurred";

    try {
      final col = _firestore.collection('data_ktp');
      final doc = col.doc();
      KTP ktp = KTP(
          userid: uid,
          dataid: doc.id,
          nama: nama,
          umur: umur,
          imageFace: imageFaceUrl,
          imagekk: imageKkUrl,
          imagettd: imageTtdUrl,
          status: "",
          catatan: "",
          createdAt: DateTime.now());
      _firestore.collection('data_ktp').doc(doc.id).set(ktp.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //add SKCK
  Future<String> tambahDataSkck(
      String nama, String imageFaceUrl, String imageKtpUrl) async {
    String res = "Some error occurred";

    try {
      final col = _firestore.collection('data_skck');
      final doc = col.doc();
      SKCK skck = SKCK(
          userid: uid,
          dataid: doc.id,
          nama: nama,
          imageFace: imageFaceUrl,
          imagektp: imageKtpUrl,
          status: "",
          catatan: "",
          createdAt: DateTime.now());
      _firestore.collection('data_skck').doc(doc.id).set(skck.toJson());
      res = "Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
