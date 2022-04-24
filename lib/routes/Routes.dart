import 'package:flutter/material.dart';

import '../pages/lib/Tabs.dart';
import '../pages/lib/Http.dart';
import '../movie/HeimaDioMovieList.dart';

//配置路由,定义Map类型的routes,Key为String类型，Value为Function类型
final Map<String,Function> routes={
      '/':(context)=>Tabs(),
      '/http':(context)=>HttpDemo(),
      // '/heimaDio':(context)=>HeimaDioMovieList(),

      // '/form':(context)=>FormPage(),
      // '/product':(context)=>ProductPage(),
      // '/productinfo':(context,{arguments})=>ProductInfoPage(arguments:arguments),
      // '/search':(context,{arguments})=>SearchPage(arguments:arguments),
};

//固定写法
var onGenerateRoute=(RouteSettings settings) {      
      //String? 表示name为可空类型
      final String? name = settings.name; 
      //Function? 表示pageContentBuilder为可空类型
      final Function? pageContentBuilder = routes[name];      
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};