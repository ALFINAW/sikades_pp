import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListKtpDetail extends StatefulWidget {
  final detail;

  ListKtpDetail({this.detail, super.key});

  @override
  State<ListKtpDetail> createState() => _ListKtpDetailState();
}

class _ListKtpDetailState extends State<ListKtpDetail> {
  bool isCheked = false;
  // final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color.fromARGB(255, 166, 243, 169),
          title: Text(
            'Detail Formulir Ajuan KTP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          child: content(),
        ));
  }

  Widget content() {
    return PhysicalModel(
      elevation: 9,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Nama : ${widget.detail['nama']}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Umur : ${widget.detail['umur']}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Status : ${widget.detail['status']}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "${widget.detail['catatan']}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
