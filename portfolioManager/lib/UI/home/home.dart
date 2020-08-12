import 'package:flutter/material.dart';
import 'package:portfolioManager/UI/home/trap_list.dart';
import 'package:portfolioManager/models/trap.dart';
import 'package:portfolioManager/services/auth.dart';
import 'package:portfolioManager/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Trap>>.value(
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
        body: TrapList(),
      ),
    );
  }
}
