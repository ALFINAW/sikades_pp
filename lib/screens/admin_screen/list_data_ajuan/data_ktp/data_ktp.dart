import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sikades/screens/admin_screen/list_data_ajuan/data_ktp/data_ktp_card.dart';
import 'package:sikades/utils/my_colors.dart';

class DataKtp extends StatefulWidget {
  const DataKtp({super.key});

  @override
  State<DataKtp> createState() => _DataKtpState();
}

class _DataKtpState extends State<DataKtp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("data_ktp");
    return data.orderBy("createdAt", descending: false).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: "FFF5E0".toColor(),
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
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
            return DataKtpCard(
              listAllDocs: listAllDocument,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
