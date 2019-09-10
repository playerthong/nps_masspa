
import 'package:scoped_model/scoped_model.dart';
import 'package:nps_masspa/api/masspa_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:nps_masspa/api/api_response.dart';

class BaseModel extends Model {




}

ApiResponse processResponseInBackground(String body){
  Map apiResponseMap = jsonDecode(body);
  ApiResponse apiResponse=ApiResponse.fromJson(apiResponseMap);
  return apiResponse;
}