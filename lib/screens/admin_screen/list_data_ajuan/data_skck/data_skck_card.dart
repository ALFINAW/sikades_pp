import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sikades/screens/admin_screen/list_data_ajuan/data_skck/data_skck_detail.dart';

class DataSkckCard extends StatefulWidget {
  final listAllDocs;
  const DataSkckCard({required this.listAllDocs, super.key});

  @override
  State<DataSkckCard> createState() => _DataSkckCardState();
}

class _DataSkckCardState extends State<DataSkckCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listAllDocs.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                var detail =
                    widget.listAllDocs[index].data() as Map<String, dynamic>;
                Get.to(DataSkckDetail(detail: detail));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      blurRadius: 6,
                      color: Color(0x34000000),
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 230,
                          child: Text(
                            "${(widget.listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                            style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Poppins'),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            DateFormat.yMMMd().format(
                                (widget.listAllDocs[index].data()
                                        as Map<String, dynamic>)['createdAt']
                                    .toDate()),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Poppins',
                                color: Colors.black54),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
