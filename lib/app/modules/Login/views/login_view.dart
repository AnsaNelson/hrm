

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/network/network_model/res/login_res.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(LoginStaffRes());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WELCOME ',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.menu),
        //     onPressed: () {
        //       showMenuOptions(context);
        //     },
        //   ),
        // ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  child: Image.asset('asset/image/logo.png'),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: controller.emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromRGBO(143, 148, 251, 1),
                            ),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          obscureText: !controller.showPassword.value,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(143, 148, 251, 1),
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey[700],
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.showPassword.toggle();
                                print('sdfsdf');
                              },
                              icon: Icon(
                                !controller.showPassword.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(143, 148, 251, 1),
                              Color.fromRGBO(143, 148, 251, .6),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () => controller.onClickLogin(context),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void showMenuOptions(BuildContext context) {
  //   showMenu(
  //     context: context,
  //     position: RelativeRect.fromLTRB(0, 100, 0, 0),
  //     items: [
  //       PopupMenuItem(
  //         child: ListTile(
  //           title: Text('Admin'),
  //           onTap: () {
  //             Navigator.pop(context);
  //           },
  //         ),
  //       ),
  //       PopupMenuItem(
  //         child: ListTile(
  //           title: Text('Staff'),
  //           onTap: () {
  //             // Handle staff selection
  //             Navigator.pop(context);
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
