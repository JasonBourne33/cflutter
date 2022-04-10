
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Map userInfo={
      "username":"zhangsan",
      "age":20
    };
    print(json.encode(userInfo));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text("get"),
            onPressed: _getData,
          ),
          ElevatedButton(
            child: Text("post"),
            onPressed: _postData,
          ),
          // ElevatedButton(
          //   child: Text("get"),
          //   onPressed: _pushNamed(context,"/http"),
          // ),

        ],
      )
    );
  }



}

_getData() async {
  var url = Uri.parse('https://jd.itying.com/api/get');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

_postData() async {
  var url = Uri.parse('https://jd.itying.com/api/httpPost');
  var response = await http.post(url,body: {"username":"張三","age":"20"});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}