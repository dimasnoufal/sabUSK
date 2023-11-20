import 'package:flutter/material.dart';
import 'package:absen_qrcode/ui/admin/schedule/form_matakuliah_activity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListMatakuliahPage extends StatefulWidget {
  const ListMatakuliahPage({Key? key}) : super(key: key);

  @override
  _ListMatakuliahPage createState() => _ListMatakuliahPage();
}

class _ListMatakuliahPage extends State<ListMatakuliahPage> {
  String searchText = '';

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("matakuliah");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Schedule"),
        ),
      ),
      body: StreamBuilder(
        stream: _items.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                .where((doc) => doc['namaDosen']
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
                .toList();
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = items[index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 50,
                      ),
                      title: Text(documentSnapshot['namaDosen'].toString()),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(documentSnapshot['jadwal'].toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(documentSnapshot['nip'].toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(documentSnapshot['matkul'].toString()),
                          )
                        ],
                      ),
                      trailing: FittedBox(
                        fit: BoxFit.fill,
                        child: Row(
                          children: [
                            // button edit
                            IconButton(
                                onPressed: () async {
                                  var result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FormMatakuliah(
                                                documentSnapshot:
                                                    documentSnapshot,
                                              )));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _delete(documentSnapshot.id);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormMatakuliah()));
        },
      ),
    );
  }

  Future<void> _delete(String productID) async {
    await _items.doc(productID).delete();

    // for snackBar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have successfully deleted a items")));
  }
}
