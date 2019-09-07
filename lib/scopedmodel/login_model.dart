import 'package:scoped_model/scoped_model.dart';
import 'package:nps_masspa/api/masspa_api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:nps_masspa/api/api_response.dart';

class LoginModel extends Model {


  void login(String username,String password,String companyCode, OnApiCallBack callBack) async{
    http.Response httpResponse= await ApiService.login(username: username,password: password,companyCode: companyCode);
    if(httpResponse.statusCode==200){
      //Do something
      ApiResponse  apiResponse=await compute(processLoginResponseInBackground,httpResponse);
      //Call back
      callBack(httpResponse,apiResponse);
    }else{
      //Call back
      callBack(httpResponse,null);
    }
  }

  ApiResponse processLoginResponseInBackground(http.Response response){
    Map apiResponseMap = jsonDecode(response.body);
    ApiResponse apiResponse=ApiResponse.fromJson(apiResponseMap);
    return apiResponse;
  }
}