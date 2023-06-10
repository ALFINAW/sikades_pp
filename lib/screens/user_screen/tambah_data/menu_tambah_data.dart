// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sikades/screens/user_screen/tambah_data/data_ktp/ajuan_ktp.dart';
import 'package:sikades/screens/user_screen/tambah_data/data_skck/ajuan_skck.dart';

class MenuTambahData extends StatefulWidget {
  const MenuTambahData({super.key});

  @override
  State<MenuTambahData> createState() => _MenuTambahDataState();
}

class _MenuTambahDataState extends State<MenuTambahData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pengajuan Surat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Center(
            child: Column(
          children: [listpengajuansurat()],
        )),
      ),
    );
  }

  Widget listpengajuansurat() {
    return Container(
      height: 652,
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AjuanKtp())));
              },
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/ktp.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Pengantar KTP',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40, left: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => FormAjuanKKPage())));
              },
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/kk.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Pengantar KK',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30, right: 5),
            child: Expanded(
                child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AjuanSkck())));
              }),
              child: Column(children: <Widget>[
                Image(
                  image: AssetImage('assets/images/skck.png'),
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Permintaan Surat Keterangan Catatan Kepolisian',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ]),
            )),
          ),
        ],
      ),
    );
  }
}
