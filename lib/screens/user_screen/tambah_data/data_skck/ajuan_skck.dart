import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/resources/firestore_method.dart';

class AjuanSkck extends StatefulWidget {
  const AjuanSkck({super.key});

  @override
  State<AjuanSkck> createState() => _AjuanSkckState();
}

class _AjuanSkckState extends State<AjuanSkck> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController namaCon = TextEditingController();

  TextEditingController upKtpCon = TextEditingController();
  TextEditingController upPasFotoCon = TextEditingController();

  XFile? _imgFace;
  XFile? _imgKtp;

  String imgUrlFace = "";
  String imgUrlKtp = "";

  String? fileNameFace;
  String? fileNameKtp;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Permintaan Surat Pengantar SKCK'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: [formajuanSkck()],
        )),
      ),
    );
  }

  Widget formajuanSkck() {
    return Container(
        height: 630,
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
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Foto Kartu Tanda Penduduk',
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
                          controller: upKtpCon,
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
                              return "upload foto KTP terlebih dahulu";
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
                                  _imgKtp = img;
                                  fileNameKtp = img.name;
                                });
                                upKtpCon.text = img.name;
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
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              addSkck(fileNameKtp!, fileNameFace!, _imgFace!,
                                  _imgKtp!);
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

  void addSkck(String fileNameKtp, String fileNameFace, XFile imageFace,
      XFile imageKtp) async {
    Reference ref = FirebaseStorage.instance.ref().child('images_skck');
    Reference imgUploadFace = ref.child(fileNameFace);

    Reference imgUploadKtp = ref.child(fileNameKtp);

    try {
      await imgUploadKtp.putFile(File(_imgKtp!.path));
      await imgUploadFace.putFile(File(_imgFace!.path));

      imgUrlKtp = await imgUploadKtp.getDownloadURL();

      imgUrlFace = await imgUploadFace.getDownloadURL();
      await FirestoreMethod()
          .tambahDataSkck(namaCon.text, imgUrlFace, imgUrlKtp);
    } catch (e) {}
  }
}
