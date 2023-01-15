import 'package:PerpustakaanDigital/controller/authController.dart';
import 'package:PerpustakaanDigital/controller/firestoreController.dart';
import 'package:PerpustakaanDigital/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class pinjamanBaru extends StatefulWidget {
  const pinjamanBaru({super.key});

  @override
  State<pinjamanBaru> createState() => _pinjamanBaruState();
}

class _pinjamanBaruState extends State<pinjamanBaru> {
  final fireC = Get.put(firestoreController());
  bool isLoading = false;
  var pink = Colors.pinkAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Pinjaman Baru',
              style: TextStyle(fontSize: 23, color: Colors.pinkAccent),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white),
            child: Column(
              children: [
                TextField(
                  controller: fireC.codeC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.code,
                        color: pink,
                      ),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      labelText: 'Code',
                      labelStyle: TextStyle(color: pink)),
                ),
                TextField(
                  controller: fireC.muridC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.people,
                        color: pink,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: pink)),
                      labelText: 'Murid',
                      labelStyle: TextStyle(color: pink)),
                ),
                TextField(
                  controller: fireC.bukuC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.book,
                        color: pink,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: pink)),
                      labelText: 'Buku',
                      labelStyle: TextStyle(color: pink)),
                ),
                TextField(
                  controller: fireC.pinjamC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: pink,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: pink)),
                      labelText: 'Tanggal Pinjam',
                      labelStyle: TextStyle(color: pink)),
                ),
                TextField(
                  controller: fireC.pengembalianC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_month_rounded,
                        color: pink,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: pink)),
                      labelText: 'Tanggal Pengembalian',
                      labelStyle: TextStyle(color: pink)),
                ),
                TextField(
                  controller: fireC.statusC,
                  style: TextStyle(color: pink),
                  cursorColor: pink,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.switch_account_sharp,
                        color: pink,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: pink)),
                      labelText: 'Status',
                      labelStyle: TextStyle(color: pink)),
                ),
              ],
            ),
          ),
          Container(
            child: (isLoading)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 40,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [
                                Colors.pinkAccent,
                                Color.fromARGB(255, 255, 113, 248)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLoading = true;
                            });
                            fireC.tambahData(
                              fireC.codeC.text,
                              fireC.muridC.text,
                              fireC.bukuC.text,
                              fireC.pinjamC.text,
                              fireC.pengembalianC.text,
                              fireC.statusC.text,
                            );
                          },
                          splashColor: Colors.blueAccent.shade100,
                          child: const Center(
                            child: Text(
                              'Tambahkan',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    ]));
  }
}
