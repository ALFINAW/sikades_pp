import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/admin_screen/list_data_ajuan/data_ktp.dart';
import 'package:sikades/screens/auth/login_screen.dart';

class MenuAjuanSUrat extends StatefulWidget {
  const MenuAjuanSUrat({super.key});

  @override
  State<MenuAjuanSUrat> createState() => _MenuAjuanSUratState();
}

class _MenuAjuanSUratState extends State<MenuAjuanSUrat>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logout, icon: Icon(Icons.login_outlined))
        ],
        title: Text(
          'list data ajuan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: 'Ktp',
            ),
            Tab(
              text: 'KK',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          DataKtp(),
          Text('kk'),
        ],
      ),
    );
  }

  void logout() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Apakah anda ingin keluar?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              ElevatedButton(
                  child: Text(
                    'Ya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Get.deleteAll();
                    Get.offAll(Login());
                  }),
              ElevatedButton(
                child: Text(
                  'Tidak',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        });
  }
}
