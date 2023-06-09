import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ListKtpDetail extends StatefulWidget {
  final detail;
  // String aduanId;
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
          elevation: 0,
          title: Text(
            'Detail Formulir Ajuan KTP',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                    widget.detail['nama'],
                    style: TextStyle(fontSize: 16),
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
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    widget.detail['status'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
