import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:login/views/login.dart';
import 'package:login/views/register.dart';

class API{

  Future register({required name,required email,required password} )async{
    String url = "http://192.168.254.7:8000/api";
    var res = await http.post(Uri.parse(url+"/register"),
      headers: <String, String>{
        'Content-Type':'application/json',
        'Accept':'application/json'},
      body:
      jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password,
      }),);
    if (res.statusCode == 200) {
      var data = jsonEncode(res.body);
      Get.to(() => Register());
      return data;
    }


  }
}