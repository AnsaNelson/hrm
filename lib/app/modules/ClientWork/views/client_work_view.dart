import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/WorkDetails/views/work_details_view.dart';
import 'package:flutter_application_1/app/widget/topcontainer.dart';
import 'package:get/get.dart';

import '../controllers/client_work_controller.dart';

class ClientWorkView extends GetView<ClientWorkController> {
 const ClientWorkView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   List<String?> data = Get.arguments;
controller.name = data[0]?.toString() ?? "";
controller.businessName = data[1]?.toString() ?? "";
controller.description = data[5]?.toString() ?? "";
controller.date = data[2]?.toString() ?? "";
controller.department = data[3]?.toString() ?? "";
controller.phoneNumber = data[4]?.toString() ?? "";

    print(controller.name);
    Get.put(ClientWorkController());
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    controller.name.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    controller.businessName.toString(),
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
                  'DESCRIPTION',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    controller.description.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ], )),
                        child: DropdownMenu<String>(
                          hintText: 'Select Status',
                          width: MediaQuery.of(context).size.width * 0.4,
                          initialSelection: controller.dropdownOptions.first,
                          onSelected: (String? value) {
                            controller.dropdownoptionValue.value = value!;
                            print(value);
                          },
                          dropdownMenuEntries: controller.dropdownOptions
                              .map<DropdownMenuEntry<String>>((String value) {
                            return DropdownMenuEntry<String>(
                                value: value, label: value);
                          }).toList(),
                        ),
                      ),
                      InkWell(
                        onTap: () => controller.submitUpdate(data[6]?.toString() ?? "",context),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(  
                              colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, .6),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text("Submit")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
