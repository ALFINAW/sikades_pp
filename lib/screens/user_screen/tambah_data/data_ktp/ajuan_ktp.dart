// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, sized_box_for_whitespace, sort_child_properties_last, empty_catches

// import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/resources/firestore_method.dart';

class AjuanKtp extends StatefulWidget {
  const AjuanKtp({super.key});

  @override
  State<AjuanKtp> createState() => _AjuanKtpState();
}

class _AjuanKtpState extends State<AjuanKtp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  User? userId;

  TextEditingController namaCon = TextEditingController();
  TextEditingController umurCon = TextEditingController();
  TextEditingController upkkCon = TextEditingController();
  TextEditingController upPasFotoCon = TextEditingController();
  TextEditingController upTtdCon = TextEditingController();
  XFile? _imgFace;
  XFile? _imgTtd;
  XFile? _imgKk;
  String imgUrlFace = "";
  String imgUrlTtd = "";
  String imgUrlKk = "";
  String? fileNameFace;
  String? fileNameTtd;
  String? fileNameKk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? idUser = "";

  Future<void> getData() async {
    await firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          idUser = snapshot.data()!['userid'];
        });
      }
    });
  }

  @override
  void initState() {
    userId = FirebaseAuth.instance.currentUser;
    namaCon.text = "";
    umurCon.text = "";
    upkkCon.text = ""; //set the initial value of text field
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
            child: Column(
          children: [jpengajuansurat(), formajuanktp()],
        )),
      ),
    );
  }

  Widget jpengajuansurat() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 104, 178, 238), width: 2))),
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        "Permintaan Surat Pengantar KTP",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget formajuanktp() {
    return Container(
        height: 652,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          child: TextFormField(
                            controller: namaCon,
                            decoration: InputDecoration(
                              hintText: 'masukan nama anda',
                              labelText: 'Nama',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding: EdgeInsets.all(15),
                            ),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "nama tidak boleh kosong";
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          child: TextFormField(
                            controller: umurCon,
                            decoration: InputDecoration(
                              hintText: 'masukan umur anda',
                              labelText: 'Umur',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              contentPadding: EdgeInsets.all(15),
                            ),
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "umur tidak boleh kosong";
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Foto Kartu Keluarga',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: true,
                          controller: upkkCon,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              hintText: 'upload file',
                              contentPadding: EdgeInsets.all(15)),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "upload foto KK terlebih dahulu";
                            }
                          },
                        )),
                        const SizedBox(width: 5),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.upload_file,
                              color: Colors.white,
                              size: 24,
                            ),
                            label: const Text('Pilih File',
                                style: TextStyle(fontSize: 16)),
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              XFile? img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (img != null) {
                                setState(() {
                                  _imgKk = img;
                                  fileNameKk = img.name;
                                });
                                upkkCon.text = img.name;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                minimumSize: const Size(122, 48),
                                maximumSize: const Size(122, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'pas foto ',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: true,
                          controller: upPasFotoCon,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              hintText: 'upload file',
                              contentPadding: EdgeInsets.all(15)),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "upload pas foto terlebih dahulu";
                            }
                          },
                        )),
                        const SizedBox(width: 5),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.upload_file,
                              color: Colors.white,
                              size: 24,
                            ),
                            label: const Text('Pilih File',
                                style: TextStyle(fontSize: 16)),
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              XFile? img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (img != null) {
                                setState(() {
                                  _imgFace = img;
                                  fileNameFace = img.name;
                                });
                                upPasFotoCon.text = img.name;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                minimumSize: const Size(122, 48),
                                maximumSize: const Size(122, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'foto tanda tangan',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          readOnly: true,
                          controller: upTtdCon,
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                              hintText: 'upload file',
                              contentPadding: EdgeInsets.all(15)),
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              return null;
                            } else {
                              return "upload foto tanda tangan terlebih dahulu";
                            }
                          },
                        )),
                        const SizedBox(width: 5),
                        ElevatedButton.icon(
                            icon: const Icon(
                              Icons.upload_file,
                              color: Colors.white,
                              size: 24,
                            ),
                            label: const Text('Pilih File',
                                style: TextStyle(fontSize: 16)),
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              XFile? img = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              if (img != null) {
                                setState(() {
                                  _imgTtd = img;
                                  fileNameTtd = img.name;
                                });
                                upTtdCon.text = img.name;
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                minimumSize: const Size(122, 48),
                                maximumSize: const Size(122, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // addData(namaCon.text, umurCon.text, _img!);
                              addKtp(fileNameKk!, fileNameTtd!, fileNameFace!,
                                  _imgFace!, _imgTtd!, _imgKk!);
                              Get.back();
                            }
                          },
                          child: Container(
                            width: 60,
                            height: 40,
                            child: Center(
                              child: Text(
                                'Ajukan',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)))),
                        )
                      ],
                    ),
                  )
                ],
              )),
        )));
  }

  // void addData(String nama, String umur, XFile image) async {
  //   CollectionReference data = firestore.collection('data_ktp');

  //   String fileName = DateTime.now().millisecondsSinceEpoch.toString();

  //   Reference ref = FirebaseStorage.instance.ref().child('images_ktp');
  //   Reference imgUpload = ref.child(fileName);

  //   try {
  //     await imgUpload.putFile(File(_img!.path));

  //     imgUrl = await imgUpload.getDownloadURL();
  //   } catch (error) {}

  //   data.add({
  //     "nama": nama,
  //     "umur": umur,
  //     "image": imgUrl,
  //     "userid": userId!.uid,
  //   });
  // }

  void addKtp(String fileNameKk, String fileNameTtd, String fileNameFace,
      XFile imageFace, XFile imageTtd, XFile imageKk) async {
    Reference ref = FirebaseStorage.instance.ref().child('images_ktp');
    Reference imgUploadFace = ref.child(fileNameFace);

    Reference imgUploadTtd = ref.child(fileNameTtd);

    Reference imgUploadKk = ref.child(fileNameKk);

    try {
      await imgUploadKk.putFile(File(_imgKk!.path));
      await imgUploadTtd.putFile(File(_imgTtd!.path));
      await imgUploadFace.putFile(File(_imgFace!.path));

      imgUrlKk = await imgUploadKk.getDownloadURL();
      imgUrlTtd = await imgUploadTtd.getDownloadURL();
      imgUrlFace = await imgUploadFace.getDownloadURL();
      await FirestoreMethod().tambahDataKtp(
          namaCon.text, umurCon.text, imgUrlFace, imgUrlKk, imgUrlTtd);
    } catch (e) {}
  }
}
