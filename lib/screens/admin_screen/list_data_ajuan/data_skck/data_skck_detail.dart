import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class DataSkckDetail extends StatefulWidget {
  final detail;
  // String aduanId;
  DataSkckDetail({this.detail, super.key});

  @override
  State<DataSkckDetail> createState() => _DataSkckDetailState();
}

class _DataSkckDetailState extends State<DataSkckDetail> {
  bool isCheked = false;
  // final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 166, 243, 169),
          title: Text(
            'Detail Formulir Ajuan SKCK',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              height: 800,
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
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Data Pas Foto :",
                    style: TextStyle(fontSize: 20),
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
                    "Data KTP :",
                    style: TextStyle(fontSize: 20),
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
                              Image.network(widget.detail['imagektp']).image)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 100,
                      padding: EdgeInsets.only(top: 15, right: 5),
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              verificationShow();
                            });
                          },
                          child: Text('Verifikasi')),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 60,
                      width: 100,
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
        .collection('data_skck')
        .doc(widget.detail['dataid'])
        .update({
      "status": statusCon.text,
    });
  }

  Future<void> addCatatan() async {
    await FirebaseFirestore.instance
        .collection('data_skck')
        .doc(widget.detail['dataid'])
        .update({
      "catatan": catatanCon.text,
    });
  }
}
