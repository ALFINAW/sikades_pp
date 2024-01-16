import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/resources/firestore_method.dart';
import 'package:sikades/utils/my_colors.dart';

import '../../dashboard_user.dart';

class AjuanKtp extends StatefulWidget {
  const AjuanKtp({super.key});

  @override
  State<AjuanKtp> createState() => _AjuanKtpState();
}

class _AjuanKtpState extends State<AjuanKtp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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

  @override
  void initState() {
    umurCon.text = "";
    upkkCon.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pengajuan Surat KTP',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: "FFF5E0".toColor(),
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          children: [formajuanktp()],
        )),
      ),
    );
  }

  Widget formajuanktp() {
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
                              fillColor: Colors.white,
                              filled: true,
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
                              fillColor: Colors.white,
                              filled: true,
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
                              fillColor: Colors.white,
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
                            'Pas Foto 3X4 ',
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
                              fillColor: Colors.white,
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
                            'Foto Tanda Tangan',
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
                              fillColor: Colors.white,
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
                    padding: EdgeInsets.only(top: 30),
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
                            }
                          },
                          child: Container(
                            width: 80,
                            height: 50,
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
      showAddDataSuccessDialog();
    } catch (e) {}
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
            'ajuan berhasil ditambahkan',
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
                Get.offAll(DashboardUser());
              },
            ),
          ],
        );
      },
    );
  }
}
