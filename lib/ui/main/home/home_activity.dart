import 'package:absen_qrcode/ui/main/history/history_attendance_activity.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:absen_qrcode/ui/main/schedule/list_matakuliah_activity.dart';
import 'package:absen_qrcode/ui/main/scan/scan_activity.dart';
import 'package:absen_qrcode/ui/main/home/home_detail/home_detail_activity.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
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
        centerTitle: true,
        title: const Text('Jadwal Kuliah'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HistoryAttedanceActivity(),
                  ));
            },
          ),
        ],
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
      // body: Center(
      //   child: Container(
      //     child: GridView.count(
      //       padding: const EdgeInsets.all(25),
      //       crossAxisCount: 2,
      //       children: <Widget>[
      //         Card(
      //           margin: const EdgeInsets.all(8),
      //           child: InkWell(
      //             onTap: () async {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => ScanActivity(),
      //                   ));
      //             },
      //             splashColor: Colors.blue,
      //             child: Center(
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: const <Widget>[
      //                   Icon(
      //                     Icons.search,
      //                     size: 70,
      //                     color: Color.fromARGB(255, 235, 235, 48),
      //                   ),
      //                   Text("Scan Qr Code", style: TextStyle(fontSize: 17.0)),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //         Card(
      //           margin: const EdgeInsets.all(8),
      //           child: InkWell(
      //             onTap: () async {
      //               Navigator.push(
      //                   context,
      //                   MaterialPageRoute(
      //                     builder: (context) => ListMatakuliahPage(),
      //                   ));
      //             },
      //             splashColor: Colors.blue,
      //             child: Center(
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: const <Widget>[
      //                   Icon(
      //                     Icons.schedule,
      //                     size: 70,
      //                     color: Color.fromARGB(255, 53, 124, 238),
      //                   ),
      //                   Text("Schedule", style: TextStyle(fontSize: 17.0)),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
