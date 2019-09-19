import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:nps_masspa/api/masspa_api.dart';
import 'package:nps_masspa/scopedmodel/base_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:nps_masspa/api/api_response.dart';


class LoginModel extends BaseModel {

  void login(LoginResource loginResource, OnApiCallBack callBack) async{
    http.Response httpResponse= await ApiService.login(loginResource);
    if(httpResponse.statusCode==200){
      //Do something
      ApiResponse  apiResponse=await compute(processResponseInBackground,httpResponse.body);
      //Call back
      callBack(httpResponse,apiResponse);
    }else{
      //Call back
      callBack(httpResponse,null);
    }
  }

}

