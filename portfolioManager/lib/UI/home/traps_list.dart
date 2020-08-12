import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class TrapsList extends StatefulWidget {
  @override
  _TrapsListState createState() => _TrapsListState();
}

class _TrapsListState extends State<TrapsList> {
  @override
  Widget build(BuildContext context) {
    final traps = Provider.of<QuerySnapshot>(context);
    // print(traps.documents);
    for (var doc in traps.documents) {
      print(doc.data);
    }

    return Container();
  }
}
