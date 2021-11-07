import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:login/services/login_api.dart';



class RegisterController extends GetxController {

  late TextEditingController nameEditingController;
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  final registerFormKey = GlobalKey<FormState>();
  final LoginApi dataService = LoginApi();
  var isLoading = false.obs;

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
    if (value.length <= 3) {
      return "This is wrong password";
    }
    else {
      return null;
    }
  }


  Future doRegister() async {
    isLoading(true);
    bool isValidated = registerFormKey.currentState!.validate();
    if (isValidated) {
      bool isValidated = registerFormKey.currentState!.validate();
      var data = dataService.login(email: emailEditingController.text,
          password: passwordEditingController.text);
    }
  }
}