import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailAttendanceActivity extends StatefulWidget {
  const DetailAttendanceActivity({super.key});

  @override
  State<DetailAttendanceActivity> createState() =>
      _DetailAttendanceActivityState();
}

class _DetailAttendanceActivityState extends State<DetailAttendanceActivity> {
  String searchText = '';

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("absen");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('History Attendance'),
      ),
      body: StreamBuilder(
        stream: _items.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                .where((doc) => doc['keterangan']
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
                      title: Text(documentSnapshot['keterangan'].toString()),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(
                                documentSnapshot['tanggalWaktu'].toString()),
                          ),
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
