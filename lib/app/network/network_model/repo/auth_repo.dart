import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/network/network_model/dioclient.dart';
import 'package:flutter_application_1/app/network/network_model/endpoints.dart';
import 'package:flutter_application_1/app/network/network_model/req/login_req.dart';
import 'package:flutter_application_1/app/network/network_model/res/login_res';

class AuthRepo{
  final DioClient dioClient = DioClient(Dio());
   Future<LoginStaffRes?> login(LoginReq loginReq)async{
    try {
      final response = await dioClient.mainReqRes(
        endPoints: EndPoints.login,
        data: loginReq.toJson(),
      );

if(response.statusCode==200){
  final loginResponse = LoginStaffRes.fromJson(response.data);
  if(loginResponse.token!=null){
    return loginResponse;
  }else{
    final loginResponse = LoginStaffRes(error: "User Not Found! Something wrong");
    return loginResponse;
  }
} else{
  final loginResponse = LoginStaffRes.fromJson(response.data);
  if(response.statusCode==400){
    return loginResponse;
  }else{
    return LoginStaffRes(error: "Unexpected Error");
  }
}
} catch (e) {
      return LoginStaffRes(error: "Unexpected Error");
    }
  }
}