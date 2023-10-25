import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sikades/screens/user_screen/list_data/list_ajuan_ktp/list_ktp_detail.dart';

class ListKtpCard extends StatefulWidget {
  final listAllDocs;
  const ListKtpCard({required this.listAllDocs, super.key});

  @override
  State<ListKtpCard> createState() => _ListKtpCardState();
}

class _ListKtpCardState extends State<ListKtpCard> {
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
                Get.to(ListKtpDetail(detail: detail));
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
                      offset: Offset(1, 3),
                    )
                  ],
                ),
                child: Row(
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
