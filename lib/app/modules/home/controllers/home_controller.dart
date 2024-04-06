// controllers/home_controller.dart

import 'package:flutter/material.dart';

import 'package:flutter_application_1/app/network/network_model/repo/staff.dart';
import 'package:flutter_application_1/app/network/network_model/res/home_res.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  // Define items, icons, and colors as class variables
 
  final Color defaultColor = Color.fromARGB(255, 150, 223, 150);
  final Color hoverColor = Colors.lightGreen;

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

  // Widget buildGridItem(int index) {
  //   // Access items, icons, and colors directly as class variables
  //   return GestureDetector(
  //     onTap: () {
  //       navigateToPage(items[index]);
  //     },
  //     child: Container(
  //       padding: EdgeInsets.all(15),
  //       decoration: BoxDecoration(
  //         color: defaultColor,
  //         borderRadius: BorderRadius.circular(15),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icons[index], size: 40, color: Colors.black), // Adjust the icon size and color as needed
  //           SizedBox(height: 10),
  //           Text(
  //             items[index],
  //             textAlign: TextAlign.center,
  //             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


Future<HomeRes?>getstaff()async{
  final Staff repo=Staff();
  final response=await repo.getStaff();
  return response;

}
  void increment() => count.value++;
}
