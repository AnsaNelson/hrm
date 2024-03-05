import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_table_2/data_table_2.dart';

import '../controllers/work_details_controller.dart';

class WorkDetailsView extends GetView<WorkDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkDetailsView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black), // Thick border around the DataTable
          ),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text('Client Name'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Date'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Work Status'),
                size: ColumnSize.S,
              ),
            ],
            rows: controller.workDetailsList.map((work) {
              return DataRow(
                cells: [
                  DataCell(Text(work['client'].toString())),
                  DataCell(Text(work['date'].toString())),
                  DataCell(_buildStatusButton(work)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusButton(Map<String, dynamic> work) {
    return ElevatedButton(
      onPressed: () {
        // Handle button press here
        // Update the work status to complete and change the color to green
        work['complete'] = true;
        // Update the UI
        controller.update();
      },
      style: ElevatedButton.styleFrom(
        primary: work['complete'] ? Colors.green : null,
      ),
      child: Text('Pending'),
    );
  }
}
