import 'package:flutter/material.dart';
import 'package:portfolioManager/UI/authenticate/authenticate.dart';
import 'package:portfolioManager/UI/home/home.dart';
import 'package:portfolioManager/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
