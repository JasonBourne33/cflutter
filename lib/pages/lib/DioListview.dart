import 'dart:convert';

import 'package:cflutter/pages/lib/EmpsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';


class DioListview extends StatelessWidget {
  const DioListview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 在 Flutter 中，每个控件，都是一个 类
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('电影列表'),
          centerTitle: true,
          // 右侧行为按钮
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text('abc@itcast.cn'),
                accountName: Text('张三'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316'),
                ),
                // 美化当前控件的
                decoration: BoxDecoration(
                  // 背景图片
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'http://www.liulongbin.top:3005/images/bg1.jpg'))),
              ),
              ListTile(
                title: Text('用户反馈'),
                trailing: Icon(Icons.feedback),
              ),
              ListTile(
                title: Text('系统设置'),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text('我要发布'),
                trailing: Icon(Icons.send),
              ),
              // 分割线控件
              Divider(),
              ListTile(
                title: Text('注销'),
                trailing: Icon(Icons.exit_to_app),
              )
            ],
          ),
        ),
        // 底部的 tabBar
        bottomNavigationBar: Container(
          // 美化当前的 Container 盒子
          decoration: BoxDecoration(color: Colors.black),
          // 一般高度都是50
          height: 50,
          child: TabBar(
            labelStyle: TextStyle(height: 0, fontSize: 10),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.movie_filter),
                text: '正在热映',
              ),
              Tab(
                icon: Icon(Icons.movie_creation),
                text: '即将上映',
              ),
              Tab(
                icon: Icon(Icons.local_movies),
                text: 'Top250',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            EmpsList(),
            EmpsList(),
            EmpsList(),
          ],
        ),
      ),
    );
  }
}
