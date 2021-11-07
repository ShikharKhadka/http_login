import 'dart:convert';
//RegisterModel userFromJson(String str) => RegisterModel.(json.decode(str));
RegisterModel loginRespFromJson(String str) => RegisterModel.fromJson(json.decode(str));
class RegisterModel {
  String? token;
  String? name;

  RegisterModel({
      this.token, 
      this.name});

  RegisterModel.fromJson(dynamic json) {
    token = json["token"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["token"] = token;
    map["name"] = name;
    return map;
  }

}