import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/resources/firestore_method.dart';
import 'package:sikades/screens/admin_screen/dashboard_admin.dart';

class TambahBerita extends StatefulWidget {
  const TambahBerita({super.key});

  @override
  State<TambahBerita> createState() => _TambahBeritaState();
}

class _TambahBeritaState extends State<TambahBerita> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController judulCon = TextEditingController();
  TextEditingController deskCon = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  XFile? _img;
  String imgUrl = "";

  @override
  void initState() {
    // userId = FirebaseAuth.instance.currentUser;

    judulCon.text = "";
    deskCon.text = "";

    super.initState();
  }

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(),
        elevation: 2,
        title: const Text(
          'Tambah Berita',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // backgroundColor: "#34495E".toColor(),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        // color: "#212F3C".toColor(),

        child: content(),
      ),
    );
  }

  Widget content() {
    return Container(
        padding: EdgeInsets.only(top: 20),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          child: Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: TextFormField(
                        controller: judulCon,
                        decoration: InputDecoration(
                            label: Text('Judul',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "judul tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: deskCon,
                        maxLines: 4,
                        decoration: InputDecoration(
                            filled: true,
                            label: Text('Deskripsi',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "deskripsi tidak boleh kosong";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: SizedBox(
                          height: 55,
                          child: TextFormField(
                            enabled: false,
                            readOnly: true,
                            controller: _imageController,
                            decoration: InputDecoration(
                                hintText: 'foto belum diupload',
                                hintStyle: TextStyle(fontFamily: 'Poppins'),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ))),
                          ),
                        )),
                        Container(
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              XFile? img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (img != null) {
                                setState(() {
                                  _img = img;
                                });
                                _imageController.text = img.name;
                              }
                            },
                            icon: Icon(Icons.photo_camera),
                            label: Text(
                              'Upload',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            // child: Text('Upload photo',
                            //     style: TextStyle(
                            //         fontFamily: 'Poppins',
                            //         fontSize: 20,
                            //         fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            tambahBerita(_img!);
                          }
                        },
                        child: Text('Tambah',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )
                  ],
                ),
              )),
        ));
  }

  Future<void> tambahBerita(XFile image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDir = referenceRoot.child('berita');
    Reference referenceImageUpload = referenceDir.child(fileName);
    try {
      await referenceImageUpload.putFile(File(image.path));
      imgUrl = await referenceImageUpload.getDownloadURL();
      await FirestoreMethod().tambahBerita(judulCon.text, deskCon.text, imgUrl);
      showAddDataSuccessDialog();
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    super.dispose();
    judulCon.dispose();
    deskCon.dispose();
  }

  void showAddDataSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'data upload',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'berita berhasil ditambahkan',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Get.offAll(DahsboardAdmin());
              },
            ),
          ],
        );
      },
    );
  }
}
