import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/network/network_model/dioclient.dart';
import 'package:flutter_application_1/app/network/network_model/endpoints.dart';
import 'package:flutter_application_1/app/network/network_model/req/workstatus_req.dart';
import 'package:flutter_application_1/app/network/network_model/res/clientview.dart';
import 'package:flutter_application_1/app/network/network_model/res/workstatus_res.dart';

class Clientview{
 final DioClient dioClient = DioClient(Dio());
Future<ClientviewRes?> getStaff() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.client,
        
      );
      if (response.statusCode == 200) {
        final userResponse = ClientviewRes.fromJson(response.data);
        return userResponse;
      } 
      else {
        final userResponse =ClientviewRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return userResponse;
        } else {
          return ClientviewRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return ClientviewRes(error: "Unexpected Error");
    }
  }
  Future<WorkstatusRes?> addwork(WorkstatusReq staffreq,String sId,) async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.workstatus,
        data: staffreq.toJson(),
        queryParameters: sId
        
      );
      if (response.statusCode == 200) {
        final workResponse = WorkstatusRes.fromJson(response.data);
        if (workResponse.error == null) {
          return workResponse;
        } else {
          final workResponse =
              WorkstatusRes(error: "User Not Register! Something wrong");
          return workResponse;
        }
      } else {
        final workResponse = WorkstatusRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return workResponse;
        } else {
          return WorkstatusRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return WorkstatusRes(error: "Unexpected Error");
    }
}
}
