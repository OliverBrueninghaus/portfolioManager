import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:portfolioManager/services/auth.dart';
import 'package:portfolioManager/services/database.dart';
import 'package:provider/provider.dart';
import 'traps_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().traps,
      child: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: Text('home Screen'),
          backgroundColor: Colors.red,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout'))
          ],
        ),
        body: TrapsList(),
      ),
    );
  }
}
