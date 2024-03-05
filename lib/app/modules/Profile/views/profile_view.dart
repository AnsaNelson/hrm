// profile_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('asset/image/pic.jpg'), // Replace with your image path
            ),
            SizedBox(height: 20),
            buildEditableTextField('Name', controller.nameController),
            SizedBox(height: 12),
            buildEditableTextField('Email ID', controller.emailController),
            SizedBox(height: 12),
            buildNonEditableTextField('Joining Date', controller.joiningDate),
            SizedBox(height: 12),
            buildNonEditableTextField('Date of Birth', controller.dob),
            SizedBox(height: 12),
            buildNonEditableTextField('Salary', controller.salary),
            SizedBox(height: 12),
            buildEditableTextField('Phone Number', controller.phoneNumberController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.updateProfile();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button color to green
                minimumSize: Size(40, 48), // Set the minimum width and height
              ),
              child: Text(
                'Update',
                style: TextStyle(fontSize: 16), // Set the button text size
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }

  Widget buildNonEditableTextField(String label, RxString value) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: value.value),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }
}
