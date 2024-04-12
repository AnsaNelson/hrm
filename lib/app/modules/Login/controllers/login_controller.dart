

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/network/network_model/repo/auth_repo.dart';
import 'package:flutter_application_1/app/network/network_model/req/login_req.dart';
import 'package:flutter_application_1/app/network/network_model/res/login_res.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool showPassword = false.obs; // Change RxBool to bool

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onClickLogin(BuildContext context) async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Warning", "Please enter your email");
      return;
    }
    final emailPattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailPattern.hasMatch(emailController.text)) {
      Get.snackbar("Warning", "Please enter a valid email address");
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar("Warning", "Please enter your password");
      return;
    }

    final AuthRepo repo = AuthRepo();
    final response = await repo.login(
        LoginReq(email: emailController.text, password: passwordController.text));
    if (response!.error == null && response.token != null) {
      Get.find<LoginStaffRes>().token = response.token;

      // Show motion toast after successful login
      ElegantNotification.success(
        title: Text('Success'),
        description: Text('Login successfully'),
        position: Alignment.center,
        shadow: BoxShadow(
          color: Colors.green.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ).show(context);

      // Navigate to HomeView after showing the success message
      Get.off(HomeView());
    } else {
      ElegantNotification.error(
        title: Text('Error'),
        description: Text('Unexpected error'),
        position: Alignment.center,
        shadow: BoxShadow(
          color: Colors.green.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ).show(context) ;
    }
  }
}
