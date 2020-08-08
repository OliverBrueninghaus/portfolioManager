import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

void getHttp() async {
  var dio = Dio();
  dio.interceptors
      .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    var customHeaders = {
      'content-type': 'application/json',
      'authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImRkYjY0ZmYxLWEyODYtNDEwNS04MzUxLTdjZjU3ODM5M2YzMyIsImlhdCI6MTU5NjkxMjI3Miwic3ViIjoiZGV2ZWxvcGVyLzc1MzhhYTQxLTY2ZjQtZDY4MC00YTc3LTViM2I1ODAyMTQxMCIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjg3LjEyMy4xOTguMTEzIl0sInR5cGUiOiJjbGllbnQifV19.0J5l4bbdaQBFkL-Xwuspny5GYXWVSBZvrIld6GT8JELdsWk6938ruSGvCbXDIlBHc7DPEj91t6InNO0ZO1AXaw'
    };
    options.headers.addAll(customHeaders);
    return options;
  }));

  Response response =
      await dio.get("https://api.clashofclans.com/v1/players/%23YGYLR89PU");
  print(response.data.toString());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new RaisedButton(onPressed: getHttp));
  }
}
