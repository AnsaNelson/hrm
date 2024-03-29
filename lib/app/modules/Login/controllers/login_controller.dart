import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final count = 0.obs;
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
  //  void login(BuildContext context) {
  //   if (formKey.currentState?.validate() ?? false) {
  //     String email = emailController.text.trim();
  //     String password = passwordController.text.trim();
  //     if(){

  //     }
      void login(BuildContext context) {
    String email = emailController.text.trim();
    String password =passwordController.text.trim();
    if (email.isEmpty || !EmailValidator.validate(email)) {
      MotionToast.warning(
        title: Text("Enter Correct Email"),
        description: Text("Please enter a valid email address."),
     

      ).show(context);
  }
  else if(password.isEmpty||password.length<6||!password.contains(RegExp(r'[A-Z]'))){
MotionToast.warning(
        title: Text("Enter Correct password"),
        description: Text("Please enter atleast more than 6 characters and also enter special characters."),
     

      ).show(context);

  }
  else{
    Get.toNamed('/home');
  }
      }
  
}