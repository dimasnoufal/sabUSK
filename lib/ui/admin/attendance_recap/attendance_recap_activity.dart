import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceRecapActivity extends StatefulWidget {
  const AttendanceRecapActivity({super.key});

  @override
  State<AttendanceRecapActivity> createState() =>
      _AttendanceRecapActivityState();
}

class _AttendanceRecapActivityState extends State<AttendanceRecapActivity> {
  final CollectionReference _items =
      FirebaseFirestore.instance.collection("absen");

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
