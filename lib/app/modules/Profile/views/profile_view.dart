// profile_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=>Get.to(HomeView()),
          child: Icon(Icons.arrow_back)),
        title: Text('Profile Page'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child:  Column(
            children: [CircleAvatar(
              radius: 80,
              // child: Image.asset('asset/image/pic.jpg'),
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:70,
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          "Name:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Ansa Nelson",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                 SizedBox(
                  height: 70,
                   child: Card(
                     child: Row(
                      children: [
                        Text(
                          "Email:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "ansa@gmail.com",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                                       ),
                   ),
                 ),
                SizedBox(height: 10),
                 SizedBox(
                  height: 70,
                   child: Card(
                     child: Row(
                      children: [
                        Text(
                          "Address:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Kurisingal House ,Munambam",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                                       ),
                   ),
                 ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          "Date of Birth:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "05/03/2002",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                 SizedBox(
                  height: 70,
                   child: Card(
                     child: Row(
                      children: [
                        Text(
                          "Joining Date:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10), 
                        Text(
                          "10/01/2024",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                                       ),
                   ),
                 ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          "Salary:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10), 
                        Text(
                          "10000",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          "Phone Number",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "7306310670",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 70,
                  child: Card(
                    child: Row(
                      children: [
                        Text(
                          "Password:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10), // Adjust the width as needed
                        Text(
                          "ansa@123",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
            
            ]
          ),
        ),
      )

    );
  }
}
