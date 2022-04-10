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
        // body: HomeContent(),
        body: HomeContent2(),
      ),
    );
  }

}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/1.png"),
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/2.png"),
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/3.png"),
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          leading: Image.network("https://www.itying.com/images/flutter/4.png"),
          trailing: Image.network("https://www.itying.com/images/flutter/6.png"),
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 pointerter6t56665db  rtyrtytrdyt'),
        ),
        ListTile(
          trailing: Image.network("https://www.itying.com/images/flutter/5.png"),
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
        ListTile(
          title: Text('Irving wins'),
          subtitle: Text('Irving score 60 point'),
        ),
      ],
    );
  }
}

class HomeContent2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        Image.network("https://www.itying.com/images/flutter/1.png"),
        Image.network("https://www.itying.com/images/flutter/2.png"),
        Image.network("https://www.itying.com/images/flutter/3.png"),
        Image.network("https://www.itying.com/images/flutter/4.png"),
        Image.network("https://www.itying.com/images/flutter/5.png"),
        Image.network("https://www.itying.com/images/flutter/6.png"),
        Image.network("https://www.itying.com/images/flutter/7.png"),
      ],
    );
  }
}




