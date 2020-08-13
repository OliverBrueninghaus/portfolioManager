import 'package:flutter/material.dart';
import 'package:portfolioManager/UI/elements/constants.dart';
import 'package:portfolioManager/UI/elements/loading.dart';
import 'package:portfolioManager/models/user.dart';
import 'package:portfolioManager/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentBomb;
  String _currentGiantBomb;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    decoration: textInputDecoration,
                    value: _currentBomb ?? userData.bomb,
                    items: sugars.map((suagr) {
                      return DropdownMenuItem(
                        value: suagr,
                        child: Text('$suagr sugars'),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentBomb = val),
                  ),
                  Slider(
                      value: (_currentGiantBomb ?? 100),
                      activeColor: Colors.brown[_currentGiantBomb ?? 100],
                      inactiveColor: Colors.brown[_currentGiantBomb ?? 100],
                      min: 100,
                      max: 900,
                      divisions: 8,
                      onChanged: (val) => setState(
                            () => _currentGiantBomb,
                          )),
                  RaisedButton(
                      color: Colors.pink,
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentName ?? userData.name,
                              _currentBomb ?? userData.bomb,
                              _currentGiantBomb ?? userData.giantBomb);
                        }
                        Navigator.pop(context);
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
