import 'package:flutter/material.dart';
import 'package:semi_final/CRUD/add.dart';
import 'package:semi_final/CRUD/delete.dart';
import 'package:semi_final/CRUD/read.dart';
import 'package:semi_final/CRUD/update.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: _title()),
            backgroundColor: Colors.white,
            elevation: 30,
            bottom: TabBar(labelColor: Colors.purple, tabs: [
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              IconButton(onPressed: () {}, icon: Icon(Icons.update)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
              IconButton(onPressed: () {}, icon: Icon(Icons.read_more)),
            ]),
          ),
          body: TabBarView(children: [
            Add_method(),
            Update_method(),
            Delete_method(),
            Read_method(),
          ])),
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
