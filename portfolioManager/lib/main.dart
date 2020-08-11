import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolioManager/UI/wrapper.dart';
import 'package:portfolioManager/services/auth.dart';
import 'package:portfolioManager/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
