

import 'package:cflutter/pages/lib/EmpsDetail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio dio = new Dio();
class EmpsList extends StatefulWidget {
  const EmpsList({Key? key}) : super(key: key);

  @override
  State<EmpsList> createState() => _EmpsListState();
}

class _EmpsListState extends State<EmpsList> {
  // 员工名list
  var mList = [];
  var total = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mList.length,
      itemBuilder: (BuildContext ctx, int i) {
        // 每次循环，都拿到当前的电影Item项
        var mitem = mList[i];
        return GestureDetector(
          onTap: () {
            // 跳转到详情
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext ctx) {
                  return new EmpsDetail(
                    empName: mitem['empName'],
                    email: mitem['email'],
                  );
                }));
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.black12))),
            child: Row(
              children: <Widget>[
                // Image.network(mitem['images']['small'],
                //     width: 130, height: 180, fit: BoxFit.cover),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('empName：${mitem['empName']}'),
                      Text('empId：${mitem['empId']}'),
                      Text('email：${mitem['email']}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }



  _getData() async {
    var response = await dio.get('http://47.112.147.20:8080/ssm-crud-0.0.1-SNAPSHOT/empsjson');
    if (response.statusCode == 200) {
      // 服务器返回的数据
      var result = response.data;
      print('result["extend"]["pageInfo"]["list"]=== ${result["extend"]["pageInfo"]["list"]}');
      setState(() {
        mList = result["extend"]["pageInfo"]["list"];
        total = result["extend"]["pageInfo"]['total'];
      });
    }
  }

}
