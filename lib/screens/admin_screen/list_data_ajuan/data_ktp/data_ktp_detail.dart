import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DataKtpDetail extends StatefulWidget {
  final detail;
  // String aduanId;
  DataKtpDetail({this.detail, super.key});

  @override
  State<DataKtpDetail> createState() => _DataKtpDetailState();
}

class _DataKtpDetailState extends State<DataKtpDetail> {
  bool isCheked = false;
  // final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Detail Formulir Ajuan KTP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: 1080,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 10, right: 15, left: 15),
              child: content(),
            ),
          ),
        ));
  }

  Widget content() {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(30),
      elevation: 3,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Nama : ${widget.detail['nama']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    "Umur : ${widget.detail['umur']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Data Pas Foto :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              Image.network(widget.detail['imageFace']).image)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Data KK :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              Image.network(widget.detail['imagekk']).image)),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Data Tanda Tangan :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              Image.network(widget.detail['imagettd']).image)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15, right: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              verificationShow();
                            });
                          },
                          child: Text('Verifikasi')),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15, left: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              catatanShow();
                            });
                          },
                          child: Text('Catatan')),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController statusCon = TextEditingController();
  TextEditingController catatanCon = TextEditingController();

  void textStatus() {
    setState(() {
      statusCon.text = widget.detail['status'];
      catatanCon.text = widget.detail['catatan'];
    });
  }

  @override
  void initState() {
    super.initState();
    textStatus();
  }

  void verificationShow() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Verifikasi'),
          content: Form(
            // key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: statusCon,
                  decoration: InputDecoration(
                    labelText: 'status',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text('Simpan'),
              onPressed: () async {
                addStatus();

                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  void catatanShow() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('catatan'),
          content: Form(
            // key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: catatanCon,
                  decoration: InputDecoration(
                    labelText: 'catatan',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Batal'),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text('Simpan'),
              onPressed: () async {
                addCatatan();

                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  // User? user = FirebaseAuth.instance.currentUser;

  Future<void> addStatus() async {
    await FirebaseFirestore.instance
        .collection('data_ktp')
        .doc(widget.detail['dataid'])
        .update({
      "status": statusCon.text,
    });
  }

  Future<void> addCatatan() async {
    await FirebaseFirestore.instance
        .collection('data_ktp')
        .doc(widget.detail['dataid'])
        .update({
      "catatan": catatanCon.text,
    });
  }
}
