import 'package:flutter/material.dart';

class InformasiDesa extends StatefulWidget {
  const InformasiDesa({super.key});

  @override
  State<InformasiDesa> createState() => _InformasiDesaState();
}

class _InformasiDesaState extends State<InformasiDesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(top: 30, bottom: 10),
        child: Center(
            child: Column(
          children: [content()],
        )),
      ),
    );
  }

  Widget content() {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 146, 240, 148),
                            width: 2))),
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Informasi Desa",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'HUBUNGI KAMI',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'KELURAHAN KRICAK',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Jl. Jatimulya TR I/666 Kelurahan Kricak, Kemantren Tegalrejo\n\n Kota Yogyakarta 55242\n\n Telpon/ Fax : (0274) 548244\n\n Email :kricak@jogjakota.go.id',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
