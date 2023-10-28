import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/resources/auth_method.dart';
import 'package:sikades/screens/admin_screen/dashboard_admin.dart';
import 'package:sikades/screens/auth/register_screen.dart';
import 'package:sikades/screens/user_screen/dashboard_user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailCon.dispose();
    passCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: content(),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      height: 550,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  child: Text(
                    'Sistem Informasi Kependudukan Desa',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    'Kelurahan Kricak, Tegalrejo, Yogyakarta',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(top: 30),
                    width: 120,
                    height: 180,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: Image.asset(
                      'assets/images/logokarangrena.png',
                    ).image))),
              ],
            ),
            Column(
              children: [
                Container(
                  child: TextFormField(
                    controller: emailCon,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email harus diisi";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: passCon,
                    decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password harus diisi";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 75,
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginUser();
                      }
                    },
                    child: Text('Sign In',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum mempunya akun?'),
                      SizedBox(width: 7),
                      InkWell(
                        onTap: () {
                          Get.to(Register());
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      String res = await AuthMethod()
          .login(email: emailCon.text, password: passCon.text);
      if (res == 'Success') {
        route();
        setState(() {
          _isLoading = false;
        });
      } else {
        loginFailed();
        setState(() {
          _isLoading = false;
        });
      }
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  // rute login
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "user") {
          Get.off(const DashboardUser());
        } else {
          Get.off(const DahsboardAdmin());
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void loginFailed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Gagal login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Username atau password salah',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF2E4053)),
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
