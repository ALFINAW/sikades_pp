import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sikades/screens/admin_screen/widget/data_user_card.dart';
import 'package:sikades/utils/my_colors.dart';

import '../auth/login_screen.dart';

class DataUsers extends StatefulWidget {
  const DataUsers({super.key});

  @override
  State<DataUsers> createState() => _DataUsersState();
}

class _DataUsersState extends State<DataUsers> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection("users");
    return data.orderBy("createdAt", descending: true).snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: logout,
              icon: Icon(
                Icons.login_outlined,
                color: Colors.white,
              ))
        ],
        title: const Text(
          'Data User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
            return DataUsersCard(
              listAllDocs: listAllDocument,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Apakah anda ingin keluar?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: Text(
                    'Ya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.deleteAll();
                    Get.offAll(Login());
                  }),
              ElevatedButton(
                child: Text(
                  'Tidak',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }
}
