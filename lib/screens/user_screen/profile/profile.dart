import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/auth/login_screen.dart';
import 'package:sikades/utils/my_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? uNik = "";
  String? uNama = "";
  String? uEmail = "";

  Future<void> getData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          uNik = snapshot.data()!['nik'];
          uNama = snapshot.data()!['username'];
          uEmail = snapshot.data()!['email'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        title: Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: "FFF5E0".toColor(),
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Center(
            child: Column(
          children: [content()],
        )),
      ),
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                      "assets/images/lprofil.png",
                      height: 180,
                      width: 120,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'NIK : ' + uNik!,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Nama : ' + uNama!,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Email : ' + uEmail!,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Get.deleteAll();
                          Get.offAll(Login());
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          child: Center(
                            child: Text(
                              'Log Out',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
