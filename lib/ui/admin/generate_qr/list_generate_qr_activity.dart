import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ListGenerateQrActivity extends StatefulWidget {
  const ListGenerateQrActivity({super.key});

  @override
  State<ListGenerateQrActivity> createState() => _ListGenerateQrActivityState();
}

class _ListGenerateQrActivityState extends State<ListGenerateQrActivity> {
  String searchText = '';

  final CollectionReference _items =
      FirebaseFirestore.instance.collection("qr");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Generate Qr"),
        ),
      ),
      body: StreamBuilder(
        stream: _items.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> items = streamSnapshot.data!.docs
                .where((doc) => doc['codeQr']
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
                      leading:
                          // Icon(
                          //   Icons.person,
                          //   size: 50,
                          // ),
                          QrImageView(
                        data: documentSnapshot['codeQr'].toString(),
                        backgroundColor: Colors.white,
                        version: QrVersions.auto,
                        size: 50,
                      ),
                      title: Text(documentSnapshot['codeQr'].toString()),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     top: 8,
                          //   ),
                          //   child: Text(documentSnapshot['codeQr'].toString()),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     top: 8,
                          //   ),
                          //   child: Text(documentSnapshot['codeQr'].toString()),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.only(
                          //     top: 8,
                          //   ),
                          //   child: Text(documentSnapshot['codeQr'].toString()),
                          // )
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
