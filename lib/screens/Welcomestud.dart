import 'package:flutter/material.dart';

class Welcome_student extends StatelessWidget {
  const Welcome_student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: _title()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child: Image(
                  image: AssetImage("images/4.jpg"),
                  fit: BoxFit.fitWidth,
                  // width: double.infinity,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "colleges in LTUC university college",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Abdulaziz Al Ghurair Department of Advanced Computing (ASAC)",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                  ),
                  Image(
                    image: AssetImage("images/5.png"),
                    width: 400,
                    height: 250,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Automotive Technology Department",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 550,
                  ),
                  Image(
                    image: AssetImage("images/6.png"),
                    width: 400,
                    height: 250,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Hotel and Tourism Department",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 590,
                  ),
                  Image(
                    image: AssetImage("images/7.jpg"),
                    width: 400,
                    height: 250,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Department of Cosmetic Arts and Sciences – Académie Laval",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 300,
                  ),
                  Image(
                    image: AssetImage("images/8.jpg"),
                    width: 400,
                    height: 250,
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Creative Media Division - SAE",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.pink,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    width: 590,
                  ),
                  Image(
                    image: AssetImage("images/9.jpg"),
                    width: 400,
                    height: 250,
                  ),
                ],
              ),
            ],
          ),
        ));
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
