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
          child: Image.network(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        width: 300,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.yellow,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: const Text('xxxooo',
            textAlign: TextAlign.right, style: TextStyle(fontSize: 20.0)),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
              color: Colors.blue,
              width: 3.0,
            )),
      ),
    );
  }
}
