
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


Dio dio = new Dio();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  //分页
  var mlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _getData();
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
            child: Text("getemps"),
            onPressed:(){
              Navigator.pushNamed(context,"/DioListview");
            },
            // onPressed: _getData,
          ),
          ElevatedButton(
            child: Text("post"),
            onPressed: _postData,
          ),
          ElevatedButton(
            child: Text("heimaDio"),
            onPressed:(){
              Navigator.pushNamed(context,"/heimaDio");
            },
          ),
          SizedBox(height: 20,),
        ],
      )
    );
  }


  _getData() async {
    var url = Uri.parse('http://47.112.147.20:8080/ssm-crud-0.0.1-SNAPSHOT/empsjson');
    var response = await dio.get(url.toString());
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    // 服务器返回的数据
    var result = response.data;
    // 今后只要为私有数据赋值，都需要把赋值的操作，放到 setState 函数中，否则，页面不会更新
    setState(() {
      // 通过 dio 返回的数据，必须使用 [] 来访问
      mlist = result['subjects'];
    });
  }
}



// _getData() async {
//   var url = Uri.parse('https://jd.itying.com/api/get');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
// }

_postData() async {
  var url = Uri.parse('https://jd.itying.com/api/httpPost');
  var response = await http.post(url,body: {"username":"張三","age":"20"});
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

_pushNamed(BuildContext context) async {
  var url = Uri.parse('https://jd.itying.com/api/pcate');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}


