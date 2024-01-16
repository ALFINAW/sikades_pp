import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/resources/firestore_method.dart';
import 'package:sikades/screens/admin_screen/dashboard_admin.dart';
import 'package:sikades/utils/my_colors.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        title: const Text(
          'Tambah Berita',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: "FFF5E0".toColor(),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15.0),
        child: content(),
      ),
    );
  }

  Widget content() {
    return Container(
        padding: EdgeInsets.only(bottom: 250, top: 10),
        child: PhysicalModel(
          color: Colors.white,
          elevation: 3,
          child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: TextFormField(
                        controller: judulCon,
                        decoration: InputDecoration(
                            label: Text(
                              'Judul',
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                            fillColor: Colors.white,
                            label: Text('Deskripsi'),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                            readOnly: true,
                            controller: _imageController,
                            decoration: InputDecoration(
                                hintText: 'foto belum diupload',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ))),
                          ),
                        )),
                        Container(
                          height: 55,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.blueGrey),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Container(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            tambahBerita(_img!);
                          }
                        },
                        child: Text('Tambah',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
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
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'berita berhasil ditambahkan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                'OK',
                style: TextStyle(
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
