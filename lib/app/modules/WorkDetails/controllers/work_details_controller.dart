import 'package:flutter_application_1/app/network/network_model/repo/client.dart';
import 'package:flutter_application_1/app/network/network_model/res/clientview.dart';
import 'package:get/get.dart';

class WorkDetailsController extends GetxController {
  final department=Get.arguments;
  

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
  Future<ClientviewRes?>fetch(department)async{
     Clientview repo=Clientview();
    final response = await repo.getStaff();
    return response;
    
  }
}





