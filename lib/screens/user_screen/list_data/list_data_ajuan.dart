import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sikades/screens/auth/login_screen.dart';

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
          Text('ktp'),
          Text('kk'),
        ],
      ),
    );
  }
}
