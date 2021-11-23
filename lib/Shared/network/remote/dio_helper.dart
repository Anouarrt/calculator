import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Dio_helper
{
  static Dio? dio;

  static init(){
    dio = Dio(
      BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type' : 'application/json',
            'lang' : 'en',
        },
      ),
    );
  }

  // Get
 static  Future<Response> getData({@required String? url , @required  query ,     String lang='ar',
   String? token,}) async
  {
    dio!.options.headers = {
      'lang' : lang,
      'Authorization' : token,
    };

    return await dio!.get(url!, queryParameters: query);
  }

  /// POST  /// I Will Use in Cubit
  static Future<Response> PostData({@required String? url ,
    query , required Map<String ,
        dynamic> data,
    String lang='ar',
    String? token,
  }) async
  {
    dio!.options.headers = {
  'lang' : lang,
  'Authorization' : token,
  };
    return  dio!.post(url!, queryParameters: query,data: data);
  }

}




/// Used Befor
/*
static init(){
  dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/',   https://student.valuxapps.com/api/
    receiveDataWhenStatusError: true,
    ),
  );
}*/
