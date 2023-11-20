import 'package:flutter/material.dart';
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
          child: Text("List Schedule"),
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
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
