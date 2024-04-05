import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/network/network_model/repo/auth_repo.dart';
import 'package:flutter_application_1/app/network/network_model/req/login_req.dart';
import 'package:flutter_application_1/app/network/network_model/res/login_res';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

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
  onClickLogin()async{ 
    final AuthRepo  repo = AuthRepo();
    final response = await repo.login(LoginReq(email: emailController.text,password: passwordController.text));
    if(response!.error == null && response.token != null){
      Get.find<LoginStaffRes>().token=response.token;//store token to a variable for 
      Get.to(HomeView());
    }else{
      Get.snackbar("Error", response.error!);
    }
  }


}
