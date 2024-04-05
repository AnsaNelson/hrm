import 'package:flutter_application_1/app/network/network_model/dioclient.dart';

enum EndPoints{
login,
home,
}
extension EndPointData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
      path="api/admin/user/login"; 
      case EndPoints.home:
      path="api/admin/user/staff";    
      }
      return path;
    }
ReqType type() {
    ReqType type;
    switch (this) {
      case EndPoints.login:
        type = ReqType.POST;
        case EndPoints.home:
        type = ReqType.GET;
    }
    return type;
    }
    bool hasToken() {
    bool hasToken = false;
    switch (this) {
      case EndPoints.login:
        hasToken = false;
        break;
        case EndPoints.home:
        hasToken = false;
        break;
    }
    return hasToken;
    }
}