import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/register_controller.dart';
import 'package:login/views/login.dart';


class Login extends GetView<RegisterController> {

  final RegisterController _controller = Get.put(RegisterController());

   Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _controller.registerFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [
            TextFormField(
              controller: _controller.emailEditingController,
              keyboardType: TextInputType.emailAddress,
              validator: (v){
                return _controller.validateEmail(v!);
              },
              decoration:  InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Email"
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _controller.passwordEditingController,
              keyboardType: TextInputType.visiblePassword,
              validator: (v){
                return _controller.validatePassword(v!);
              },
              decoration:  InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Password"
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:(){
                _controller.doRegister();
              },

              child: const Text('Login'),
            ),
            const SizedBox(height: 30),
            Center(
              child: GestureDetector(
                onTap: (){
                  Get.to(() => Login());
                  //Navigator.push(context, new MaterialPageRoute(builder: (context)=>Register()));
                },
                child: const Text("Create account"),
              ),
            ),
            const SizedBox(height: 30),
            Obx(() => _controller.isLoading.value == true ?
            const Center(
                child: CircularProgressIndicator()): const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}


