import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sikades/screens/user_screen/list_data/list_ajuan_ktp/list_ktp_card.dart';
import 'package:sikades/utils/my_colors.dart';

class ListKtp extends StatefulWidget {
  const ListKtp({super.key});

  @override
  State<ListKtp> createState() => _ListKtpState();
}

class _ListKtpState extends State<ListKtp> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("data_ktp");
    return data.where('userid', isEqualTo: uid).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: "FFF5E0".toColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: content(),
      ),
    );
  }

  Widget content() {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocument = snapshot.data!.docs;
            return ListKtpCard(
              listAllDocs: listAllDocument,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
