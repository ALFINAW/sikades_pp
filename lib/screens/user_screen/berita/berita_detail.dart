import 'package:flutter/material.dart';

class BeritaDetail extends StatefulWidget {
  final detail;
  const BeritaDetail({required this.detail, super.key});

  @override
  State<BeritaDetail> createState() => _BeritaDetailState();
}

class _BeritaDetailState extends State<BeritaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          // backgroundColor: "#2E4053".toColor(),

          title: const Text(
            'Berita',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: content());
  }

  Widget content() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(widget.detail['imageUrl']).image)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Text(
              widget.detail['judul'],
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              widget.detail['deskripsi'],
              style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
