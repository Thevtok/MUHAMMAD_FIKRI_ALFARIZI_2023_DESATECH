import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class firestoreController extends GetxController {
  TextEditingController codeC = TextEditingController();
  TextEditingController muridC = TextEditingController();
  TextEditingController bukuC = TextEditingController();
  TextEditingController pinjamC = TextEditingController();
  TextEditingController pengembalianC = TextEditingController();
  TextEditingController statusC = TextEditingController();
  final Stream<QuerySnapshot> userStream =
      FirebaseFirestore.instance.collection('murid').snapshots();
  final Stream<QuerySnapshot> bukuStream =
      FirebaseFirestore.instance.collection('buku').snapshots();
  final Stream<QuerySnapshot> pinjamStream =
      FirebaseFirestore.instance.collection('pinjaman').snapshots();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future updateData(String code, String murid, String buku, String pinjam,
      String pengembalian, String status, String docId) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('pinjaman').doc(docId);
    try {
      await documentReference.update({
        'code': code,
        'murid': murid,
        'buku': buku,
        'tanggal pinjam': pinjam,
        'tanggal pengembalian': pengembalian,
        'status': status
      }).then((value) => Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil mengubah data',
          onConfirm: () {
            codeC.clear();
            muridC.clear();
            bukuC.clear();
            pinjamC.clear();
            pengembalianC.clear();
            statusC.clear();
            Get.back();
            Get.back();
          },
          textConfirm: 'OKAY'));
    } on FirebaseException {
      Get.defaultDialog(
          title: 'Terjadi kesalahan', middleText: 'Gagal mengubah data');
    }
  }

  Stream<DocumentSnapshot> getData(String docId) {
    return FirebaseFirestore.instance
        .collection('pinjaman')
        .doc(docId)
        .snapshots();
  }

  Future deleteData(String docID) async {
    await FirebaseFirestore.instance
        .collection('pinjaman')
        .doc(docID)
        .delete()
        .then((value) => Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Berhasil menghapus data',
            onConfirm: () {
              codeC.clear();
              muridC.clear();
              bukuC.clear();
              pinjamC.clear();
              pengembalianC.clear();
              statusC.clear();
              Get.back();
              Get.back();
            },
            textConfirm: 'OKAY'));
  }

  Future tambahData(
    String code,
    String murid,
    String buku,
    String pinjam,
    String pengembalian,
    String status,
  ) async {
    await FirebaseFirestore.instance.collection('pinjaman').add({
      'code': code,
      'murid': murid,
      'buku': buku,
      'tanggal pinjam': pinjam,
      'tanggal pengembalian': pengembalian,
      'status': status
    }).then((value) => Get.defaultDialog(
        title: 'Berhasil',
        middleText: 'Berhasil Menambah data',
        onConfirm: () {
          codeC.clear();
          muridC.clear();
          bukuC.clear();
          pinjamC.clear();
          pengembalianC.clear();
          statusC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: 'OKAY'));
  }
}
