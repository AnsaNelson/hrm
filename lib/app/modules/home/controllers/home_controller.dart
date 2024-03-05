// controllers/home_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  // Define items, icons, and colors as class variables
  final List<String> items = ['Profile', 'Client Details', 'Work Details', 'Logout'];
  final List<IconData> icons = [Icons.person, Icons.business, Icons.work, Icons.exit_to_app];
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

  Widget buildGridItem(int index) {
    // Access items, icons, and colors directly as class variables
    return GestureDetector(
      onTap: () {
        navigateToPage(items[index]);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icons[index], size: 40, color: Colors.black), // Adjust the icon size and color as needed
            SizedBox(height: 10),
            Text(
              items[index],
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToPage(String pageName) {
    switch (pageName) {
      case 'Profile':
        Get.toNamed('/profile');
        break;
      case 'Client Details':
        Get.toNamed('/client-details');
        break;
      case 'Work Details':
        Get.toNamed('/work-details');
        break;
      case 'Logout':
        // Add logout logic here
        break;
      default:
        break;
    }
  }

  void increment() => count.value++;
}
