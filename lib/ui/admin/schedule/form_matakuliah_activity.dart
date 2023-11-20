import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormMatakuliah extends StatefulWidget {
  final DocumentSnapshot? documentSnapshot;

  FormMatakuliah({this.documentSnapshot});

  @override
  _FormMatakuliah createState() => _FormMatakuliah();
}

class _FormMatakuliah extends State<FormMatakuliah> {
  final CollectionReference _items =
      FirebaseFirestore.instance.collection("matakuliah");

  @override
  void initState() {
    super.initState();
  }

  TextEditingController _namaDosenController = TextEditingController();
  TextEditingController _jadwalController = TextEditingController();
  TextEditingController _nipController = TextEditingController();
  TextEditingController _mataKuliahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Matakuliah'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: _namaDosenController,
              decoration: InputDecoration(
                  labelText: 'Nama Dosen',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: _jadwalController,
              decoration: InputDecoration(
                  labelText: 'Jadwal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: _nipController,
              decoration: InputDecoration(
                  labelText: 'NIP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: TextField(
              controller: _mataKuliahController,
              decoration: InputDecoration(
                  labelText: 'Matakuliah',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              // child: (widget.matakuliah == null)
              //     ? Text(
              //         'Add',
              //         style: TextStyle(color: Colors.white),
              //       )
              //     : Text(
              //         'Update',
              //         style: TextStyle(color: Colors.white),
              //       ),
              child: Text("Save"),
              onPressed: () async {
                upsertMatakuliahFirebase(widget.documentSnapshot);
              },
            ),
          )
        ],
      ),
    );
  }

  Future<void> upsertMatakuliahFirebase(
      [DocumentSnapshot? documentSnapshot]) async {
    final String namaDosen = _namaDosenController.text;
    final String jadwal = _jadwalController.text;
    final String nip = _nipController.text;
    final String matakuliah = _mataKuliahController.text;

    if (documentSnapshot != null) {
      //update
      _namaDosenController.text = documentSnapshot['namaDosen'].toString();
      _jadwalController.text = documentSnapshot['jadwal'].toString();
      _nipController.text = documentSnapshot['nip'].toString();
      _mataKuliahController.text = documentSnapshot['matkul'].toString();

      await _items.doc(documentSnapshot!.id).update({
        "namaDosen": namaDosen,
        "jadwal": jadwal,
        "nip": nip,
        "matkul": matakuliah
      });
      _namaDosenController.text = '';
      _jadwalController.text = '';
      _nipController.text = '';
      _mataKuliahController.text = '';

      Navigator.pop(context, 'update');
    } else {
      //insert
      await _items.add({
        "namaDosen": namaDosen,
        "jadwal": jadwal,
        "nip": nip,
        "matkul": matakuliah
      });
      _namaDosenController.text = '';
      _jadwalController.text = '';
      _nipController.text = '';
      _mataKuliahController.text = '';

      Navigator.pop(context, 'save');
    }
  }
}
