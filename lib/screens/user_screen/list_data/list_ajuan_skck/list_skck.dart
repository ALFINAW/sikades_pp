import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sikades/screens/user_screen/list_data/list_ajuan_skck/list_skck_card.dart';
import 'package:sikades/utils/my_colors.dart';

class ListSkck extends StatefulWidget {
  const ListSkck({super.key});

  @override
  State<ListSkck> createState() => _ListSkckState();
}

class _ListSkckState extends State<ListSkck> {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("data_skck");
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
            return ListSkckCard(
              listAllDocs: listAllDocument,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
