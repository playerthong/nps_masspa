import 'dart:convert';

import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/login_response.dart';
import 'package:nps_masspa/storage/share_preferences.dart';
import 'package:nps_masspa/utils/string_utils.dart';

class AppSharedPrefHelper {

    static void setLoginResponse(LoginResponse loginResponse) async {
        if(loginResponse==null){
            SharePreferences.removeString(SharePreferences.LOGIN_DATA);
        }else{
            String jsonString = jsonEncode(loginResponse);
            SharePreferences.putString(SharePreferences.LOGIN_DATA, jsonString);
        }

    }

    static Future<LoginResponse> getLoginResponse() async {
        String jsonString = await SharePreferences.getString(SharePreferences.LOGIN_DATA);
        if (!StringUtils.isEmpty(jsonString)) {
            return LoginResponse.fromJson(jsonDecode(jsonString));
        }
        return null;
    }

    static Future<Branch> getBranchSelected() async {
        LoginResponse loginResponse = await getLoginResponse();
        if (loginResponse != null) {
            return loginResponse.branch;
        }
        return null;
    }

    static void setPhoneNumber(String phoneNumber) {
        SharePreferences.putString(SharePreferences.PHONE_NUMBER, phoneNumber);
    }

    static Future<String> getPhoneNumber() async {
        return await SharePreferences.getString(SharePreferences.PHONE_NUMBER);
    }
}