import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/ClientWork/controllers/client_work_controller.dart';
import 'package:flutter_application_1/app/modules/ClientWork/views/client_work_view.dart';
import 'package:flutter_application_1/app/network/network_model/res/clientview.dart';
import 'package:get/get.dart';

import '../controllers/work_details_controller.dart';

class WorkDetailsView extends GetView<WorkDetailsController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ClientWorkController());
    final department=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Client Form')),
      ),
      body: FutureBuilder<ClientviewRes?>(
        future: controller.fetch(department),
        builder: (context, snapshot) {
          if(snapshot.hasData){
          return ListView.builder(
          itemCount: snapshot.data!.clients?.length,
          itemBuilder: (context, index) {
         return Container(
          height: 80,
          width: 30,
           child: Card(
            child: Column(
              children: [
           ListTile(
            onTap: () {
       
             Get.to(() => ClientWorkView(),arguments: [
              snapshot.data!.clients?[index].name,
              snapshot.data!.clients?[index].businessName,
              snapshot.data!.clients?[index].date,
              snapshot.data!.clients?[index].department,
              snapshot.data!.clients?[index].phoneNumber,
              snapshot.data!.clients?[index].description,
              snapshot.data!.clients?[index].sId,

              
             ]
              
             

             );
             
            },
            
            title: Text('${snapshot.data!.clients?[index].name}'),
            subtitle: Text('${snapshot.data!.clients?[index].businessName}'),
            trailing: Text('${snapshot.data!.clients?[index].phoneNumber}'),
           )
              // Center(child: Text(controller.clientList[index].name))
            ]
            ,) 
            ),
         );
        }
        );
          }
          else {
            return Center(
              child: CircularProgressIndicator(),
            );
                    }
        },
      )
    );
  }
}

 
