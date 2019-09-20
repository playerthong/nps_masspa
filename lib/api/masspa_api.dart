import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:nps_masspa/api/api_response.dart';
import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/model/login_response.dart';
import 'package:nps_masspa/model/resource/emotion_resource.dart';
import 'package:nps_masspa/storage/app_shared_perf_helper.dart';
import 'package:nps_masspa/utils/constants.dart';
import 'package:nps_masspa/utils/string_utils.dart';

typedef void OnApiCallBack(http.Response response, ApiResponse apiResponse);


class ApiService {


  static final Map<String, String>  baseHeaders = {
      'Content-Type': 'application/json',
      "Device-Timezone": DateTime.now().timeZoneOffset.toString(),
      "Device-Timezone-Name": DateTime.now().timeZoneName,
      "Device-OS-Version": Platform.operatingSystemVersion,
      "Device-OS": Platform.isIOS ?  "iOS" : Platform.isAndroid ? "Android" : "Other",
      "Device-Application-Version": "1.0.0",
      "Device-Build-Number": "1",
      "apikey":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjowLjEwMzM4NzI1NTA1MTE1ODMxLCJpYXQiOjE1Njg2OTcxNzUsImV4cCI6MTY1NTA5NzE3NX0.CMY9vFIs5zqzCZIMtbKNTp7ySkr1hdG_txW1qvR8joE",
      "X-Request-ID":DateTime.now().millisecond.toString()
    };

  static Future<Map<String, String>> modifyHeaders() async {
      Map<String, String> headers = baseHeaders;
      LoginResponse loginResponse = await AppSharedPrefHelper.getLoginResponse();
      if (loginResponse != null && !StringUtils.isEmpty(loginResponse.token)) {
          headers.putIfAbsent('authorization', () => loginResponse.token);
      }
      return headers;
  }


  static Future<http.Response> login(LoginResource loginResource) async {
    final response = await http.post(  Constants.BASE_API+'/app/api/public/users/loginPOS',headers: baseHeaders,body: json.encode(loginResource.toJson()));
    return response;
  }

  static Future<http.Response> sendEmotion(EmotionResource emotionResource) async {
    final response = await http.post(
            Constants.BASE_API + '/app/api/secure/npsservices/create',
            headers: await modifyHeaders(),
            body: jsonEncode(emotionResource.toJson())
    );
    return response;
  }
}

