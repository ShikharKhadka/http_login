
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controllers/login_controller.dart';
import 'package:login/views/register.dart';

class Register extends GetView<LoginController> {

  final LoginController _controller = Get.put(LoginController());

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _controller.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          children: [
            TextFormField(
              controller: _controller.nameEditingController,
              validator: (v){
                return _controller.validateName(v!);
              },
              keyboardType: TextInputType.name,
              decoration:  InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Name"
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: _controller.emailEditingController,
              validator: (v){
                return _controller.validateEmail(v!);
              },
              keyboardType: TextInputType.emailAddress,
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
              validator: (v){
                return _controller.validatePassword(v!);
              },

              keyboardType: TextInputType.visiblePassword,
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
                _controller.doLogin();
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 30),

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
