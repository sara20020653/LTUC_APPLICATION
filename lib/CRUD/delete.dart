import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Delete_method extends StatefulWidget {
  const Delete_method({super.key});

  @override
  State<Delete_method> createState() => _Delete_methodState();
}

class _Delete_methodState extends State<Delete_method> {
  final CollectionReference _students =
      FirebaseFirestore.instance.collection("student");

  Future<void> _delete(String studentId) async {
    await _students.doc(studentId).delete();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Product Deleted"),
    ));
  }

  CollectionReference studentRef =
      FirebaseFirestore.instance.collection("student");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        return Container(
            child: ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, i) {
            final DocumentSnapshot myRow = snapshot.data!.docs[i];
            return Center(
              child: TextButton(
                onPressed: () {
                  _delete(myRow.id);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: double.infinity,
                  child: Card(
                      color: Colors.purple,
                      child: Text(
                        "Delete ${snapshot.data!.docs[i]['name']}",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ),
            );
          },
        ));
      },
      future: studentRef.get(),
    );
  }
}
