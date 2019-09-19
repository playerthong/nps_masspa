
import 'dart:convert';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferences {
    static final String LOGIN_DATA="LOGIN_DATA";

    static void saveLoginResponse(BranchResponse branchResponse) async{
        String data=jsonEncode(branchResponse);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(LOGIN_DATA, data);
    }

    static Future<BranchResponse> getLoginResponse() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String data=prefs.get(LOGIN_DATA);
      if(data!=null){
        Map loginResponseMap = jsonDecode(data);
        var loginResponse = BranchResponse.fromJson(loginResponseMap);
        return loginResponse;
      }else{
        return null;
      }
    }
}