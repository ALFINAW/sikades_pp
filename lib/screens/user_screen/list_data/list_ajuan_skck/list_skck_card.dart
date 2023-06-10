import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sikades/screens/user_screen/list_data/list_ajuan_skck/list_skck_detail.dart';

class ListSkckCard extends StatefulWidget {
  final listAllDocs;
  const ListSkckCard({required this.listAllDocs, super.key});

  @override
  State<ListSkckCard> createState() => _ListSkckCardState();
}

class _ListSkckCardState extends State<ListSkckCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.listAllDocs.length,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                var detail =
                    widget.listAllDocs[index].data() as Map<String, dynamic>;
                Get.to(ListSkckDetail(detail: detail));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: 120,
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
                  borderRadius: BorderRadius.circular(20),
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
