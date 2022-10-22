import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_method extends StatelessWidget {
  const Add_method({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController id = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController course = TextEditingController();
    return Container(
      child: ListView(children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: Text("      Add the student information "),
        ),
        Text("      ID of student"),
        TextField(
          controller: id,
        ),
        Text("      Name of student"),
        TextField(
          controller: name,
        ),
        Text("      course of student"),
        TextField(
          controller: course,
        ),
        TextButton(
            onPressed: () {
              CollectionReference studentRef =
                  FirebaseFirestore.instance.collection("student");

              studentRef.add(
                  {'id': id.text, 'name': name.text, 'course': course.text});
            },
            child: Text("add the student "))
      ]),
    );
  }
}
