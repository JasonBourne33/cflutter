import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tabs/Home.dart';
import 'tabs/Setting.dart';
import 'tabs/Category.dart';

class Tabs extends StatefulWidget{
  const Tabs({Key? key}) : super(key: key);

  _TabsState createState()=>_TabsState();
}

class _TabsState extends State<Tabs>{

  int _currentIndex=0;
  List _pageList=[
    HomePage(),
    Category(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter title"),
      ),
      // body: HomeContent(),
      // body: HomeContent(),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex=index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],

      ),
    );
  }

}