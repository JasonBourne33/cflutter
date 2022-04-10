
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class HttpDemo extends StatefulWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  State<HttpDemo> createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  List _list=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._getData();
  }
  _getData() async {
    var url = Uri.parse('https://jd.itying.com/api/pcate');
    var response = await http.get(url);
    if(response.statusCode==200) {
      print(json.decode(response.body));
      setState((){
         this._list=json.decode(response.body)["result"];
      });
      // 22.24
}
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}
