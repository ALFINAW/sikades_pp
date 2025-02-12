import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/admin_screen/data_users.dart';

import 'package:sikades/screens/admin_screen/daftar_surat_ajuan_warga.dart';
import 'package:sikades/screens/admin_screen/tambah_berita.dart';
import 'package:sikades/utils/my_colors.dart';

class DahsboardAdmin extends StatefulWidget {
  const DahsboardAdmin({super.key});

  @override
  State<DahsboardAdmin> createState() => _DahsboardAdminState();
}

class _DahsboardAdminState extends State<DahsboardAdmin> {
  int _selected_index = 0;

  void _updated_index(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  Future<bool> onBackPressed() {
    if (_selected_index != 0) {
      setState(() {
        _selected_index = 0;
      });
      return Future.value(false); // Tidak tindak lanjuti navigasi kembali
    }
    return Future.value(true); // Tindak lanjuti navigasi kembali
  }

  final pages = [
    MenuAjuanSUrat(),
    DataUsers(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(color: "#141E46".toColor()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    padding: EdgeInsets.only(right: 20),
                    onPressed: () {
                      _updated_index(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color: _selected_index == 0
                          ? "#ECF0F1".toColor()
                          : "#979A9A".toColor(),
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    onPressed: () {
                      _updated_index(1);
                    },
                    icon: Icon(
                      Icons.person,
                      color: _selected_index == 1
                          ? "#ECF0F1".toColor()
                          : "#979A9A".toColor(),
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selected_index,
          children: pages,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: "#FF6969".toColor(),
            child: Icon(
              Icons.add,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(TambahBerita());
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
