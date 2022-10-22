import 'dart:html';

import 'package:semi_final/screens/Welcome.dart';
import 'package:semi_final/screens/Welcomestud.dart';
import 'package:semi_final/screens/resetPassword.dart';
import 'package:semi_final/screens/signup_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: _title()),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.purple,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/1.png"))),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ResetPassword();
                    },
                  ));
                },
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: Colors.purple, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple),
                    child: const Text('Login'),
                    onPressed: () async {
                      try {
                        var authin = FirebaseAuth.instance;
                        UserCredential user =
                            await authin.signInWithEmailAndPassword(
                                email: nameController.text,
                                password: passwordController.text);

                        if (nameController.text == "saraalassimi@gmail.com") {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Welcome();
                            },
                          ));
                        } else {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Welcome_student();
                            },
                          ));
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("sorry invalid email or pass")));
                      }
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return SignUpPage();
                        },
                      ));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}

Widget _title() {
  return RichText(
    softWrap: false,
    text: TextSpan(
        onEnter: ((event) {
          print("123");
        }),
        text: 'Lt',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: Colors.purple),
        children: [
          TextSpan(
            text: 'uc Stu',
            style: TextStyle(color: Colors.pink, fontSize: 30),
          ),
          TextSpan(
            text: 'dents',
            style: TextStyle(color: Colors.purple, fontSize: 30),
          ),
        ]),
  );
}
