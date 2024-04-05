import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/WorkDetails/views/work_details_view.dart';

import 'package:flutter_application_1/app/widget/topcontainer.dart';

import 'package:get/get.dart';


import '../controllers/client_work_controller.dart';

class ClientWorkView extends GetView<ClientWorkController> {
  const ClientWorkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                TopContainer(
                  height: 200,
                  width: 800,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // CircleAvatar(
                            //   backgroundColor: const Color.fromARGB(255, 239, 240, 243),
                            //   radius: 35.0,
                            //   backgroundImage: AssetImage(
                            //     'assets/images/avatar.png',
                            //   ),
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: const Text(
                                    'Client Name',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Text(
                                    'Business Name',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Get.off(WorkDetailsView());
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ],
            ),
            // Add your description title, description, and button here
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Description Title',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Description text goes here...',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                 InkWell(
                  onTap: ()=>{
                   Get.to('')
                  },
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                        width: 100,
                        height: 50,
                         child: Container(
                          
                          decoration: BoxDecoration(
                           gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(143, 148, 251, 1),
                            Color.fromRGBO(143, 148, 251, .6),
                          ],
                        ),
                            shape: BoxShape.rectangle,
                           
                         borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(child: Text("Pending")),
                         ),
                       ),
                       SizedBox(
                        width: 100,
                        height: 50,
                         child: Container(
                          decoration: BoxDecoration( gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(246, 246, 247, 1),
                              Color.fromRGBO(163, 202, 241, 0.6),
                            ],
                          ),
                          shape: BoxShape.rectangle,
                          ),
                          child: Center(child: Text("Starting date")),
                         ),
                       )
                     ],
                   ),
                 )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
