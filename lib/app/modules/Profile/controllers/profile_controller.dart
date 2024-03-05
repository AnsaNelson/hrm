// profile_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  RxString joiningDate = ''.obs;
  RxString dob = ''.obs;
  RxString salary = ''.obs;
  final count = 0.obs;

  @override
  void onInit() {
    nameController.text = 'Anza Nelson';
    emailController.text = 'ansa@gmail.com';
    phoneNumberController.text = '+1234567890';
    joiningDate.value = '2022-01-01';
    dob.value = '2002/3/05';
    salary.value = '10000';
    super.onInit();
  }

  void updateProfile() {
    // Update the data when the "Update" button is clicked
    nameController.text = 'Updated Name';
    emailController.text = 'updated.email@example.com';
    phoneNumberController.text = '+9876543210';
  }

  void increment() => count.value++;
}
