// ignore_for_file: file_names

import 'package:PerpustakaanDigital/model/pinjamanBaru.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class transaksi extends StatelessWidget {
  final String code;
  final String murid;
  final String buku;
  final String tanggalPinjam;
  final String tanggalPengembalian;
  final String status;

  final Function? onUpdate;

  bool pinjaman = false;
  transaksi(
    this.code,
    this.murid,
    this.buku,
    this.tanggalPinjam,
    this.tanggalPengembalian,
    this.status, {
    super.key,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade900)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Code: $code', style: const TextStyle(fontSize: 16)),
                Text(
                  'Murid : $murid',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Buku: $buku',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Tanggal Pinjam: $tanggalPinjam',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Tanggal Pengembalian: $tanggalPengembalian',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  'Status: $status',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 49, 216, 119),
                              Color.fromARGB(255, 25, 92, 66)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: InkWell(
                          onTap: () {
                            if (onUpdate != null) onUpdate!();
                          },
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 40,
                            ),
                          )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
