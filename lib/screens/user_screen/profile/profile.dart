import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/auth/login_screen.dart';

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
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Center(
            child: Column(
          children: [jprofil(), content()],
        )),
      ),
    );
  }

  Widget jprofil() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 146, 240, 148), width: 2))),
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Profil",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 3,
            borderRadius: BorderRadius.circular(30),
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
                      "assets/images/logo.png",
                      height: 180,
                      width: 120,
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                Color.fromARGB(255, 99, 96, 96)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      )
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
