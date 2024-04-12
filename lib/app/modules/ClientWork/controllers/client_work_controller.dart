

import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:flutter_application_1/app/network/network_model/repo/client.dart';
import 'package:flutter_application_1/app/network/network_model/req/workstatus_req.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class ClientWorkController extends GetxController {
  
     RxString dropdownoptionValue = 'Business Card'.obs;
   



 final List<String> dropdownOptions = <String>[
  'Starting',
  'Complete',
  'Pending',
];


  final count = 0.obs;

 String? name;
 String? businessName;
 String? description;
 String? phoneNumber;
 String? department;
 String? date;
 String? sId;
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

 void submitUpdate(sId,BuildContext context) async {
  Clientview repo = Clientview();

    final response = await repo.addwork(
      WorkstatusReq(
        workStatus: dropdownoptionValue.value,
        name: name,
        date: date,
        department: department,
        description: description,
        phoneNumber: phoneNumber,
        businessName: businessName,
      ),
      sId,
      
    );

    if (response != null && response.error == null) {
       ElegantNotification.success(
        title: Text('Success'),
        description: Text('Update Successfully'),
        position: Alignment.center,
        shadow: BoxShadow(
          color: Colors.green.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 4),
        ),
      ).show(context);
      Get.offAll(HomeView());
    }

}

}