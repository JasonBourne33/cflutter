import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }

  _getData() async {
    var url =
        Uri.parse('http://47.112.147.20:8080/ssm-crud-0.0.1-SNAPSHOT/empsjson');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      print(json.decode(response.body)["extend"]["pageInfo"]["list"]);
      setState(() {
        this._list = json.decode(response.body)["extend"]["pageInfo"]["list"];
      });
      // 22.24
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("request data demo"),
        ),
        body: this._list.length > 0
            // ? Text("length=0  qwq"+_list.length.toString())
            ? ListView.builder(
                itemCount: this._list.length,
                itemBuilder: (context, index) {
                  return ListTile(title: this._list[index]["title"]);
                },
              )
            : Text("length=0  qwq"+_list.length.toString()));
  }
}
