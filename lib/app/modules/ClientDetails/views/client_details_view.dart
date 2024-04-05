// client_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/ClientDetails/controllers/client_details_controller.dart';
import 'package:get/get.dart';


class ClientDetailsView extends GetView<ClientController> {
  const ClientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Client Form')),
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
          trailing: Text(controller.clientList[index].number),
         )
            // Center(child: Text(controller.clientList[index].name))
          ]
          ,) 
          ),
       );
      }
      )
    );
  }
}
