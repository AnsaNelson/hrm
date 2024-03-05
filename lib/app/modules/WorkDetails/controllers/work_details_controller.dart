import 'package:get/get.dart';

class WorkDetailsController extends GetxController {
  final List<Map<String, dynamic>> _workDetailsList = [
    {'client': 'John', 'date': '2024-03-04', 'complete': false, 'pending': true},
    // Add more work details as needed
  ];

  List<Map<String, dynamic>> get workDetailsList => _workDetailsList;

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
}
