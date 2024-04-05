import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/ClientWork/views/client_work_view.dart';
import 'package:get/get.dart';

import '../controllers/work_details_controller.dart';

class WorkDetailsView extends GetView<WorkDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkDetailsView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.clientList.length,
        itemBuilder: (context, index) {
       return Container(
        height: 80,
        width: 30,
         child: Card(
          child: Column(
            children: [
         ListTile(
          title: Text(controller.clientList[index].name),
          subtitle: Text(controller.clientList[index].work),
          onTap:()=> Get.to(ClientWorkView()),
          trailing: Text(controller.clientList[index].number),
         )
            // Center(child: Text(controller.clientList[index].name))
          ]
          ,) 
          ),
       );
      })
    );
  }
}
