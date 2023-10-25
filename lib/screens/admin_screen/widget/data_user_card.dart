import 'package:flutter/material.dart';

class DataUsersCard extends StatefulWidget {
  final listAllDocs;
  const DataUsersCard({required this.listAllDocs, super.key});

  @override
  State<DataUsersCard> createState() => _DataUsersCardState();
}

class _DataUsersCardState extends State<DataUsersCard> {
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
                // var detail =
                //     widget.listAllDocs[index].data() as Map<String, dynamic>;
                // Get.to(DataUserDetail(detail: detail));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                width: MediaQuery.of(context).size.width,
                height: 145,
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
                            "NIK : ${(widget.listAllDocs[index].data() as Map<String, dynamic>)["nik"]}",
                            style: TextStyle(fontSize: 16.0),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            "Nama : ${(widget.listAllDocs[index].data() as Map<String, dynamic>)["username"]}",
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: 230,
                          child: Text(
                            "Email : ${(widget.listAllDocs[index].data() as Map<String, dynamic>)["email"]}",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            maxLines: 2,
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
