import 'package:flutter/material.dart';
import 'package:sikades/utils/my_colors.dart';

class AjuanKk extends StatefulWidget {
  const AjuanKk({super.key});

  @override
  State<AjuanKk> createState() => _AjuanKkState();
}

class _AjuanKkState extends State<AjuanKk> {
  final items = ['Pengajuan KK', 'Pengajuan KTP', 'Pengajuan SKCK'];

  // Nilai yang dipilih
  String selectedItem = 'Pengajuan KK';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: "#C70039".toColor(),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pengajuan Surat KK',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          child: Column(
        children: [
          DropdownButtonFormField(
            value: selectedItem,
            onChanged: (String? value) {
              setState(() {
                selectedItem = value!;
              });
            },
            items: items.map((String item) {
              return DropdownMenuItem(
                child: Text(item),
                value: item,
              );
            }).toList(),
          ),
          // Form pengajuan KK
          if (selectedItem == "Pengajuan KK")
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nomor KK",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nomor KTP",
                    ),
                  ),
                ],
              ),
            ),
          // Form pengajuan KTP
          if (selectedItem == "Pengajuan KTP")
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "kyp",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nomor KTP",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Tanggal Lahir",
                    ),
                  ),
                ],
              ),
            ),
          // Form pengajuan SKCK
          if (selectedItem == "Pengajuan SKCK")
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nama Lengkap",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "skck",
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Nomor SKCK",
                    ),
                  ),
                ],
              ),
            ),
        ],
      )),
    );
  }
}
