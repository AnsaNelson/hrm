 import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/network/network_model/dioclient.dart';
import 'package:flutter_application_1/app/network/network_model/endpoints.dart';
import 'package:flutter_application_1/app/network/network_model/res/home_res.dart';

class Staff{
 final DioClient dioClient = DioClient(Dio());
Future<HomeRes> getStaff() async {
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.home,
        
      );
      if (response.statusCode == 200) {
        final userResponse = HomeRes.fromJson(response.data);
        return userResponse;
      } 
      else {
        final userResponse =HomeRes.fromJson(response.data);
        if (response.statusCode == 400) {
          return userResponse;
        } else {
          return HomeRes.fromJson(response.data);
        }
      }
    } catch (e) {
      return HomeRes(error: "Unexpected Error");
    }
  }
 }