import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/resources/auth_method.dart';
import 'package:sikades/screens/auth/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController userNameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController nikCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameCon.dispose();
    emailCon.dispose();
    nikCon.dispose();
    passwordCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(child: content()),
      ),
    );
  }

  Widget content() {
    return Container(
      height: 650,
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: userNameCon,
                  decoration: InputDecoration(
                    label: Text('Nama Lengkap'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap masukan nama";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  controller: emailCon,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Harap masukan email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  controller: nikCon,
                  keyboardType: TextInputType.numberWithOptions(),
                  maxLength: 16,
                  decoration: InputDecoration(
                    label: Text('NIK', style: TextStyle()),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[0-9]{16}$').hasMatch(value)) {
                      return "Harap masukan NIK dengan benar";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                child: TextFormField(
                  controller: passwordCon,
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text('Password', style: TextStyle()),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: _requeiredConfirmValidator,
                ),
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      label: Text('Konfirmasi Password', style: TextStyle()),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: _requeiredConfirmValidator,
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      registerUser();
                    }
                  },
                  child: Text('Sign Up',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sudah mempunyai akun? '),
                    SizedBox(width: 7),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  void registerUser() async {
    final auth = FirebaseAuth.instance;

    var uName = userNameCon.text;
    var uEmail = emailCon.text.trim();
    var uNIK = nikCon.text.trim();
    var uPass = passwordCon.text.trim();

    final List<String> loginMethod =
        await auth.fetchSignInMethodsForEmail(uEmail);
    if (loginMethod.isEmpty) {
      await AuthMethod()
          .register(username: uName, email: uEmail, password: uPass, nik: uNIK);
      showSignUpSuccessDialog();
    } else {
      showEmailErr();
    }
  }

  String? _requeiredConfirmValidator(String? confirmPasswordText) {
    if (confirmPasswordText == null || confirmPasswordText.trim().isEmpty) {
      return 'Harap masukan password';
    }
    if (passwordCon.text != confirmPasswordText) {
      return 'Password tidak sama';
    } else {
      return null;
    }
  }

  void showEmailErr() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Email sudah terdaftar',
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

  void showSignUpSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Register',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Pendaftaran behasil',
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
                FirebaseAuth.instance.signOut();
                Get.offAll(const Login());
              },
            ),
          ],
        );
      },
    );
  }
}
