import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/models/register_model.dart';
import 'package:login/services/login_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/services/register_api.dart';

class LoginController extends GetxController {

  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  String name = '',
      password = '',
      email = '';
  API dataService = API();

  @override
  void onInit() {
    nameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    nameEditingController.dispose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }



  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "This is wrong email";
    }
    else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.length <= 5) {
      return "This is wrong password";
    }
    else {
      return null;
    }
  }

  String? validateName(String value){
    if(value.isEmpty){
      return "Please enter name";
    }
    else{
      return null;
    }
  }

  doLogin() async {
    bool isValidated = loginFormKey.currentState!.validate();

    if (isValidated) {
      isLoading(true);

      var data = await API().register(name:nameEditingController.text ,email:emailEditingController.text ,password:passwordEditingController.text );
      if(data != null){
        print (data);
      }
      else{
        print("Fail");
      }
    }
    else{
      Get.snackbar("Register", "Problem in register");
    }
  }


}