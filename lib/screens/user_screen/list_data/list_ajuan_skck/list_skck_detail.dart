import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sikades/utils/my_colors.dart';

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
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: "#C70039".toColor(),
          centerTitle: true,
          title: Text(
            'Detail Formulir Ajuan SKCK',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          color: "FFF5E0".toColor(),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          child: content(),
        ));
  }

  Widget content() {
    return Container(
      padding: EdgeInsets.only(bottom: 260, top: 10),
      child: PhysicalModel(
        elevation: 9,
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.detail['nama']}',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.detail['status']}',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Keterangan:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${widget.detail['catatan']}",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
