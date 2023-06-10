import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListSkckDetail extends StatefulWidget {
  final detail;
  // String aduanId;
  ListSkckDetail({this.detail, super.key});

  @override
  State<ListSkckDetail> createState() => _ListSkckDetailState();
}

class _ListSkckDetailState extends State<ListSkckDetail> {
  bool isCheked = false;
  // final mq = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Detail Formulir Ajuan SKCK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          child: content(),
        ));
  }

  Widget content() {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(30),
      elevation: 3,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
        child: Column(
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
                "Status : ${widget.detail['status']}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "${widget.detail['catatan']}",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
