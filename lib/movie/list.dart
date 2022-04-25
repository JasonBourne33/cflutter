import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

Dio dio = new Dio();

class MovieList extends StatefulWidget {
  // 固定写法
  // MovieList({Key key}) : super(key: key);
  MovieList({Key? key, required this.mt}) : super(key: key);

  // 电影类型
  final String mt;

  @override
  _MovieListState createState() {
    return new _MovieListState();
  }
}

// 有状态控件，必须结合一个状态管理类，来进行实现
class _MovieListState extends State<MovieList>
    with AutomaticKeepAliveClientMixin {
  // 默认显示第一页数据
  int page = 1;
  // 每页显示的数据条数
  int pagesize = 10;
  // 电影列表数据
  var mlist = [];
  // 总数据条数，实现分页效果的
  var total = 0;

  @override
  bool get wantKeepAlive => true;

  // 控件被创建的时候，会执行 initState
  @override
  void initState() {
    super.initState();
    getMovieList();
  }

  // 渲染当前这个 MovieList 控件的UI结构
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext ctx, int i) {
        // 每次循环，都拿到当前的电影Item项
        var mitem = mlist[i];
        return GestureDetector(
          onTap: () {
            // 跳转到详情
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext ctx) {
              return new MovieDetail(
                id: mitem['id'],
                title: mitem['title'],
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
                Image.network(mitem['images']['small'],
                    width: 130, height: 180, fit: BoxFit.cover),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('电影名称：${mitem['title']}'),
                      Text('上映年份：${mitem['year']}年'),
                      Text('电影类型：${mitem['genres'].join('，')}'),
                      Text('豆瓣评分：${mitem['rating']['average']}分'),
                      Text('主要演员：${mitem['title']}')
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

  // 获取电影列表数据
  getMovieList() async {
    // js 中有模板字符串
    // 偏移量的计算公式 (page - 1) * pagesize
    int offset = (page - 1) * pagesize;
    var response = await dio.get(
        'http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pagesize');

    // 服务器返回的数据
    var result = response.data;
    print('result=== $result');

    // 今后只要为私有数据赋值，都需要把赋值的操作，放到 setState 函数中，否则，页面不会更新
    setState(() {
      // 通过 dio 返回的数据，必须使用 [] 来访问
      mlist = result['subjects'];
      total = result['total'];
    });
  }
}
