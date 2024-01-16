import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikades/utils/my_colors.dart';

class AjuanKk extends StatefulWidget {
  const AjuanKk({super.key});

  @override
  State<AjuanKk> createState() => _AjuanKkState();
}

class _AjuanKkState extends State<AjuanKk> {
  final items = [
    'Baru Menikah',
    'Penambahan Anggota Keluarga',
    'Pengurangan Anggota Keluarga'
  ];

  // Nilai yang dipilih
  String selectedItem = 'Baru Menikah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: const EdgeInsets.all(16.0),
          color: "FFF5E0".toColor(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pilih alasan pembuatan KK',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              DropdownButtonFormField(
                padding: EdgeInsets.only(left: 20, right: 20),
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
              if (selectedItem == "Baru Menikah")
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto KK Asli Pihak Perempuan',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto KK pihak perempuan terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto KK Asli Pihak Laki-laki',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto KK pihak laki-laki terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto Buku Nikah',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto buku nikah terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   // addData(namaCon.text, umurCon.text, _img!);
                                //   addKtp(fileNameKk!, fileNameTtd!, fileNameFace!,
                                //       _imgFace!, _imgTtd!, _imgKk!);
                                //   Get.back();
                                // }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Ajukan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              // Form pengajuan KTP
              if (selectedItem == "Penambahan Anggota Keluarga")
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto Surat Keterangan Lahir',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto KK pihak perempuan terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto KK Lama',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto KK pihak laki-laki terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   // addData(namaCon.text, umurCon.text, _img!);
                                //   addKtp(fileNameKk!, fileNameTtd!, fileNameFace!,
                                //       _imgFace!, _imgTtd!, _imgKk!);
                                //   Get.back();
                                // }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Ajukan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              // Form pengajuan SKCK
              if (selectedItem == "Pengurangan Anggota Keluarga")
                Form(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto KK Lama',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto KK lama terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Foto Surat Pendukung (Surat kematian, surat keterangan pindah, dan/atau surat cerai)',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              readOnly: true,
                              // controller: upkkCon,
                              decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  hintText: 'upload file',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (value) {
                                if (value!.isNotEmpty) {
                                  return null;
                                } else {
                                  return "upload foto surat pendukung terlebih dahulu";
                                }
                              },
                            )),
                            const SizedBox(width: 5),
                            ElevatedButton.icon(
                                icon: const Icon(
                                  Icons.upload_file,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                label: const Text('Pilih File',
                                    style: TextStyle(fontSize: 16)),
                                onPressed: () async {
                                  final ImagePicker _picker = ImagePicker();
                                  XFile? img = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (img != null) {
                                    // setState(() {
                                    //   _imgKk = img;
                                    //   fileNameKk = img.name;
                                    // });
                                    // upkkCon.text = img.name;
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.grey,
                                    minimumSize: const Size(122, 48),
                                    maximumSize: const Size(122, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   // addData(namaCon.text, umurCon.text, _img!);
                                //   addKtp(fileNameKk!, fileNameTtd!, fileNameFace!,
                                //       _imgFace!, _imgTtd!, _imgKk!);
                                //   Get.back();
                                // }
                              },
                              child: Container(
                                width: 80,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Ajukan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          )),
    );
  }
}
