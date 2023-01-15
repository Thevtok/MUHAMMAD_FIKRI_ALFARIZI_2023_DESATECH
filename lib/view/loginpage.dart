import 'package:PerpustakaanDigital/controller/authController.dart';
import 'package:PerpustakaanDigital/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authC = Get.put(AuthContoller());
  bool isLoading = false;
  var pink = Colors.pinkAccent;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/loginperpus.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/perpus.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Perpustakaan Online',
                style: TextStyle(fontSize: 23, color: Colors.pinkAccent),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 120,
              padding: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white),
              child: Column(
                children: [
                  TextField(
                    controller: authC.emailC,
                    style: TextStyle(color: pink),
                    cursorColor: pink,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_rounded,
                          color: pink,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: pink)),
                  ),
                  TextField(
                    controller: authC.passC,
                    obscureText: true,
                    style: TextStyle(color: pink),
                    cursorColor: pink,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.key,
                          color: pink,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: pink)),
                        labelText: 'Password',
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
                              authC.signIn(authC.emailC.text, authC.passC.text);
                            },
                            splashColor: Colors.blueAccent.shade100,
                            child: const Center(
                              child: Text(
                                'LOGIN',
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
      ),
    );
  }
}
