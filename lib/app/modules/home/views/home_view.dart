import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/modules/Profile/views/profile_view.dart';
import 'package:flutter_application_1/app/network/network_model/res/home_res.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {

    final List<String> items = ['Profile', 'Client Details', 'Work Details', 'Logout'];
    final List<IconData> icons = [Icons.person, Icons.business, Icons.work, Icons.exit_to_app];
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome...'),
      ),
      body: FutureBuilder<HomeRes?>(
        future: controller.getstaff(),
        builder: (context, snapshot) {
     
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            final imageUrl = snapshot.data?.image;

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (imageUrl != null && imageUrl.isNotEmpty)
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFCFDFC),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20.0, // Set cross-axis spacing
                          mainAxisSpacing: 20.0, // Set main-axis spacing
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0), // Add padding for the gap
                            child: GestureDetector(
                              onTap: () {
                                if (items[index] == 'Profile') {
                                  navigateToPage(items[index],snapshot.data!);
                                } else {
                                  navigateToPage(items[index],snapshot.data!);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(icons[index], size: 40, color: Colors.black),
                                    SizedBox(height: 10),
                                    Text(
                                      items[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20), // Add spacing between the GridView and other widgets
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }

  void navigateToPage(String pageName, dynamic data) {
    switch (pageName) {
      case 'Profile':
      Get.toNamed('/profile',arguments: data);
      break;
      case 'Client Details':
        Get.toNamed('/client-details',arguments: data.department);
        break;
      case 'Work Details':
        Get.toNamed('/work-details');
        break;
      case 'Logout':
        Get.toNamed('/login');
        break;
      default:
        break;
    }
  }
}
void navigateToProfile(HomeRes data) {
  print(data.toString());
    Get.to(() => ProfileView(), arguments: data);
  }
