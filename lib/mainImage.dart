import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("flutter title"),
        ),
        // body: HomeContent(),
        body: ImageContent(),
      ),
    );
  }
}

class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: ClipOval(
          // child: Image.network(
          //   "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
          //   width: 300.0,
          //   height: 300.0,
          //   fit: BoxFit.cover,
          // ),
          child: Image.asset(
            "images/a.png",
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

