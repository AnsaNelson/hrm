import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/data/url.dart';
import 'package:flutter_application_1/app/network/network_model/endpoints.dart';
import 'package:flutter_application_1/app/network/network_model/res/login_res.dart';
import 'package:get/get.dart' as G;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ),
    );
  }

  Future<dynamic> mainReqRes({
    required EndPoints endPoints,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    String? queryParameters,  
  }) async {
    Response response;
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
    String? _token = G.Get.find<LoginStaffRes>().email;
    if (endPoints.hasToken()) {
      String? _token = G.Get.find<LoginStaffRes>().token;
      _dio.options.headers
          .addAll({"Authorization": "Bearer ${_token ?? "No Token"}"});
      print("Token: $_token");
    }
    print("Token: $_token");
    try {
      switch (endPoints.type()) {
        case ReqType.GET:
          response = await _dio.get(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
            queryParameters: data,
          );
          break;
        case ReqType.POST:
          response = await _dio.post(
            "$BASE_URl/${endPoints.path()}",
            data: data,
          );
          break;
        case ReqType.PUT:
   response = await _dio.patch(
            queryParameters != null
                ? "$BASE_URl/${endPoints.path()}/$queryParameters"
                : "$BASE_URl/${endPoints.path()}",
    data: data,
  );
  break;

        case ReqType.DELETE:
          response = await _dio.delete(
            "$BASE_URl/${endPoints.path()}/$queryParameters",
            data: data,
          );
          break;
        default:
          response = await _dio.post(
            "$BASE_URl/${endPoints.path()}",
            data: data,
          );
      }
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response!;
      } else {
        switch (e.type) {
          case DioException.receiveTimeout:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Received time out",
              statusCode: 700,
            );
            break;
          default:
            response = Response(
              requestOptions: e.requestOptions,
              statusMessage: "Some error happened",
              statusCode: 800,
            );
        }
      }
      return response;
    }
  }
}

enum ReqType {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
}