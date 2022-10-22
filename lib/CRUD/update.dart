import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Update_method extends StatefulWidget {
  const Update_method({super.key});

  @override
  State<Update_method> createState() => _Update_methodState();
}

class _Update_methodState extends State<Update_method> {
  final CollectionReference _students =
      FirebaseFirestore.instance.collection("student");
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  Future<void> _update([DocumentSnapshot? myRow]) async {
    if (myRow != null) {
      idController.text = myRow['id'].toString();
      nameController.text = myRow['name'];
      courseController.text = myRow['course'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'id',
                  ),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextField(
                  controller: courseController,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String name = nameController.text;
                    final int? id = int.tryParse(idController.text);
                    final String course = courseController.text;
                    if (id != null) {
                      await _students
                          .doc(myRow!.id)
                          .update({"name": name, "id": id, "course": course});
                      idController.text = '';
                      nameController.text = '';
                      courseController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _students.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot myRow =
                        streamSnapshot.data!.docs[index];
                    return Card(
                      color: Colors.purple,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(myRow['name']),
                        subtitle: Text(
                            myRow['id'].toString() + "     " + myRow['course']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(children: [
                            IconButton(
                              onPressed: () {
                                _update(myRow);
                              },
                              icon: Icon(Icons.edit),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                );
              }
              return Center(
                child: Text("you have no data"),
              );
            }));
  }
}
