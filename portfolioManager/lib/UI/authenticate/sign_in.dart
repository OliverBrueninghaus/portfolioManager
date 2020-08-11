import 'package:flutter/material.dart';
import 'package:portfolioManager/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
            child: Text('Sign in Anon'),
            onPressed: () async {
              dynamic result = await _auth.signInAnonymous();
              if (result == null) {
                print('error signing in');
              } else {
                print('signed in');
                print(result.uid);
              }
            }),
      ),
    );
  }
}
