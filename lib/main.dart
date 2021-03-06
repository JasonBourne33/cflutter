import 'package:cflutter/pages/lib/Tabs.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'routes/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //route init
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Tabs());

  }
}
