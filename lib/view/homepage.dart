import 'package:PerpustakaanDigital/controller/firestoreController.dart';
import 'package:PerpustakaanDigital/model/daftarBuku.dart';
import 'package:PerpustakaanDigital/model/dataSiswa.dart';
import 'package:PerpustakaanDigital/model/editTransaksi.dart';
import 'package:PerpustakaanDigital/model/pinjamanBaru.dart';
import 'package:PerpustakaanDigital/model/transaksi.dart';
import 'package:PerpustakaanDigital/view/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreC = Get.put(firestoreController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            centerTitle: true,
            backgroundColor: Colors.pinkAccent,
            title: const Text('Perpustakaan'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(value: 1, child: Text('Logout')),
                    PopupMenuItem(value: 2, child: Text('Pinjaman Baru'))
                  ];
                },
                onSelected: (value) async {
                  if (value == 1) {
                    await FirebaseAuth.instance.signOut();
                    Get.off(() => const LoginPage());
                  } else if (value == 2) {
                    Get.to(() => const pinjamanBaru());
                  }
                },
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(text: 'Data Siswa'),
              Tab(text: 'Daftar Buku'),
              Tab(text: 'Transaksi'),
            ]),
          ),
          body: TabBarView(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: firestoreC.userStream,
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    var dataMurid = snapshot.data!.docs;
                    return ListView(
                        children: dataMurid.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return dataSiswa(
                          data['id'], data['nama'], data['kelas'], data['nik']);
                    }).toList());
                  }),
              StreamBuilder<QuerySnapshot>(
                  stream: firestoreC.bukuStream,
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    var dataMurid = snapshot.data!.docs;
                    return ListView(
                        children: dataMurid.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return daftarBuku(data['foto'], data['id'], data['nama']);
                    }).toList());
                  }),
              StreamBuilder<QuerySnapshot>(
                  stream: firestoreC.pinjamStream,
                  builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
                    var dataMurid = snapshot.data!.docs;
                    return ListView(
                        children: dataMurid.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return transaksi(
                        data['code'],
                        data['murid'],
                        data['buku'],
                        data['tanggal pinjam'],
                        data['tanggal pengembalian'],
                        data['status'],
                        onUpdate: () {
                          Get.to(() => const editTransaksi(),
                              arguments: document.id,
                              transition: Transition.rightToLeft);
                        },
                      );
                    }).toList());
                  }),
            ],
          )),
    );
  }
}
