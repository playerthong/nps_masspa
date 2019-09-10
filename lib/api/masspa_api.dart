import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:nps_masspa/api/api_response.dart';
import 'package:nps_masspa/model/login_resource.dart';

typedef void OnApiCallBack(http.Response response, ApiResponse apiResponse);


class ApiService {
  static final String BASE_API="https://mascall.herokuapp.com";

  static final  Map<String, String>  baseHeaders = {
      'Content-Type': 'application/json',
      "Device-Timezone": DateTime.now().timeZoneOffset.toString(),
      "Device-Timezone-Name": DateTime.now().timeZoneName,
      "Device-OS-Version": Platform.operatingSystemVersion,
      "Device-OS": Platform.isIOS ?  "iOS" : Platform.isAndroid ? "Android" : "Other",
      "Device-Application-Version": "1.0.0",
      "Device-Build-Number": "1",
      "X-Request-ID":DateTime.now().millisecond.toString()
    };


  static Future<http.Response> login({String username,String password,String companyCode}) async {
    LoginResource loginResource=new LoginResource(username: username,password: password,companyCode: companyCode);
    final response = await http.post(  BASE_API+'/api/employee/public/users/signin',headers: baseHeaders,body: json.encode(loginResource.toJson()));
    return response;
  }

}

