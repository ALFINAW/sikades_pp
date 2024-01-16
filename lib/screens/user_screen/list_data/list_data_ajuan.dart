import 'package:flutter/material.dart';

import 'package:sikades/screens/user_screen/list_data/list_ajuan_ktp/list_ktp.dart';
import 'package:sikades/screens/user_screen/list_data/list_ajuan_skck/list_skck.dart';
import 'package:sikades/screens/user_screen/list_data/list_ajuan_kk/list_kk.dart';
import 'package:sikades/utils/my_colors.dart';

class ListDataAjuan extends StatefulWidget {
  const ListDataAjuan({super.key});

  @override
  State<ListDataAjuan> createState() => _ListDataAjuanState();
}

class _ListDataAjuanState extends State<ListDataAjuan>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
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
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        title: Text(
          'Daftar Surat Ajuan',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: TabBar(
          labelColor: Colors.white,
          controller: controller,
          tabs: [
            Tab(
              child: Text('KTP'),
            ),
            Tab(
              child: Text('KK'),
            ),
            Tab(
              child: Text('SKCK'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [const ListKtp(), const ListKk(), const ListSkck()],
      ),
    );
  }
}
