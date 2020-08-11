import 'package:flutter/material.dart';
import 'package:portfolioManager/UI/authenticate/authenticate.dart';
import 'package:portfolioManager/UI/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    return Authenticate();
  }
}
