import 'package:flutter/material.dart';
import 'package:sikades/utils/my_colors.dart';

class InformasiDesa extends StatefulWidget {
  const InformasiDesa({super.key});

  @override
  State<InformasiDesa> createState() => _InformasiDesaState();
}

class _InformasiDesaState extends State<InformasiDesa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        title: Text(
          'Informasi Desa',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        color: "FFF5E0".toColor(),
        padding: const EdgeInsets.all(16.0),
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'DESA KARANGRENA',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'PROFIL',
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
                  'Desa kami adalah Desa yang menjunjung tinggi\nkearifan lokal dalam bermasyarakat dan bernegara.',
                  style: TextStyle(fontSize: 15),
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
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Jl. Rajawali RT/RW 3/2, Karangrena, Kec. Maos, Kabupaten Cilacap, \nJawa Tengah 53272\nTelpon : 0888-6839-006\nEmail :karangrena@gmail.com',
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
