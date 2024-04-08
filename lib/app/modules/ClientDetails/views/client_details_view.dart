// client_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/ClientDetails/controllers/client_details_controller.dart';
import 'package:flutter_application_1/app/network/network_model/res/clientview.dart';
import 'package:get/get.dart';


class ClientDetailsView extends GetView<ClientController> {
  const ClientDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final department=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Client Form')),
      ),
      body: FutureBuilder<ClientviewRes?>(
        future: controller.fetchclient(department),
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
