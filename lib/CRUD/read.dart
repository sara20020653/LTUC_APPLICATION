import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Read_method extends StatelessWidget {
  const Read_method({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentRef =
        FirebaseFirestore.instance.collection("student");
    return Container(
      child: FutureBuilder<QuerySnapshot>(

        builder: (context, snapshot) {
          return Container(
              child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, i) 
            
            {
              final DocumentSnapshot myRow = snapshot.data!.docs[i];
              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(child: Text("${snapshot.data!.docs[i]['id']}")),
                  Center(child: Text("${snapshot.data!.docs[i]['name']}")),
                  Center(child: Text("${snapshot.data!.docs[i]['course']}")),
                ],
              );
            },
          ));
        },
        future: studentRef.get(),
      ),
    );
  }
}
