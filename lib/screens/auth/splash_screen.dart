import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/admin_screen/dashboard_admin.dart';
import 'package:sikades/screens/auth/login_screen.dart';
import 'package:sikades/screens/user_screen/dashboard_user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;
  String? role = "";
  @override
  void initState() {
    // TODO: implement initState
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    openHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 120,
            height: 180,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.asset(
              'assets/images/logokarangrena.png',
            ).image))),
      ),
    );
  }

  openHome() {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get()
            .then((DocumentSnapshot snap) {
          if (snap.exists) {
            if (snap.get('role') == 'admin') {
              Get.off(() => const DahsboardAdmin());
            } else if (snap.get('role') == 'user') {
              Get.off(() => const DashboardUser());
            }
          }
        });
      } else {
        Get.off(const Login());
      }
    });
  }
}
