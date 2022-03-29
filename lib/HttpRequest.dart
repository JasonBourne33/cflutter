import 'package:dio/dio.dart';


class HttpRequest {
  Dio dio=new Dio();

  late BaseOptions options;

  void getHttp() async {
    try {
      var response = await Dio().get('http://www.google.cn');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  // HttpRequest([BaseOptions? baseOptions]) {
  //   if (baseOptions == null) {
  //     baseOptions = BaseOptions(
  //         baseUrl: 'http://192.168.1.17:3000',
  //         connectTimeout: 5000,
  //         receiveTimeout: 3000);
  //   }
  //   this.options = baseOptions;
  //   dio = Dio(options);
  //   dio.interceptors.add(
  //       InterceptorsWrapper(onRequest: (RequestOptions options) {
  //     return options;
  //   }, onResponse: (Response response) {
  //     return response;
  //   }, onError: (DioError e) {
  //     print("request error==========$e");
  //     return e;
  //   }));
  // }

  // Future get(String path,
  //     {queryParameter, Options options, CancelToken cancelToken}) async {
  //   return await dio.get(
  //       path: path,
  //       queryParameters: queryParameters,
  //       options: options,
  //       cancelToken: cancelToken);
  // }
}
