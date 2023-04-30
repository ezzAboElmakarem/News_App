
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class dio_helper {

 static late Dio  dio ;

 static init(){
   dio = Dio(
       BaseOptions(
           receiveDataWhenStatusError: true,
         baseUrl: "https://newsapi.org/",
       )
   );
 }

  static Future getdata({
  required String uri,
  required  Map<String,dynamic> query
})
 async {

 return await dio.get(uri,queryParameters: query);

 }


}