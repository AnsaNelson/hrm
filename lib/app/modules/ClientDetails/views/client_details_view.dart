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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildTextField(context, 'Name', controller.nameController),
            SizedBox(height: 12),
            buildDateTimeField(context, 'Select Date'),
            SizedBox(height: 12),
            buildTextField(context, 'Business Name', controller.businessNameController),
            SizedBox(height: 12),
            buildTextField(context, 'Address', controller.addressController),
            SizedBox(height: 12),
            buildTextField(context, 'Phone Number', controller.phoneNumberController),
            SizedBox(height: 12),
            buildDropdownField('Select an Option', controller.dropdownOptions, controller.selectedOption),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.submitForm();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Set the button color
                minimumSize: Size(10, 50), // Set the button width
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String label, TextEditingController controller) {
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

  Widget buildDateTimeField(BuildContext context, String label) {
    return InkWell(
      onTap: () {
        _selectDate(context); // Call a function to handle date selection
      },
      child: InputDecorator(
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
        child: Row(
          children: [
            Icon(Icons.calendar_today),
            SizedBox(width: 10),
            Text('Select Date'),
          ],
        ),
      ),
    );
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != controller.selectedDate) {
      // Handle selected date
      print('Selected date: $pickedDate');
      controller.selectedDate = pickedDate;
    }
  }

  Widget buildDropdownField(String label, List<String> options, String selectedValue) {
    return DropdownButtonFormField(
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
      value: selectedValue,
      onChanged: (newValue) {
        controller.selectedOption = newValue.toString();
      },
      items: options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}
