// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: camel_case_types
class daftarBuku extends StatelessWidget {
  final String foto;
  final String id;
  final String nama;

  const daftarBuku(this.foto, this.id, this.nama, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade900)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(foto), fit: BoxFit.cover)),
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    'ID: $id',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text('Nama: $nama',
                        style: const TextStyle(fontSize: 16))),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
