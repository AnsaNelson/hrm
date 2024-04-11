import 'package:flutter_application_1/app/network/network_model/dioclient.dart';

enum EndPoints{
login,
home,
client,
workstatus,
}
extension EndPointData on EndPoints {
  String path() {
    String path = "";
    switch (this) {
      case EndPoints.login:
      path="api/admin/user/login"; 
      case EndPoints.home:
      path="api/admin/user/staff/single";
      case EndPoints.client:
      path="api/admin/client/clients/department/digital marketting"; 
      case EndPoints.workstatus:
      path="api/admin/client/updateWorkStatus";    
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
        case EndPoints.client:
        type = ReqType.GET;
        case EndPoints.workstatus:
        type = ReqType.PUT;
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
        hasToken = true;
        break;
        case EndPoints.client:
        hasToken = false;
        break;
        case EndPoints.workstatus:
        hasToken = false;
        break;
    }
    return hasToken;
    }
}