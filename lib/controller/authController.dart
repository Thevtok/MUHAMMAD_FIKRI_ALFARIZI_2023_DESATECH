import 'package:PerpustakaanDigital/view/homepage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthContoller extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  void signIn(String email, String pass) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    Get.off(() => const HomePage());
  }
}
