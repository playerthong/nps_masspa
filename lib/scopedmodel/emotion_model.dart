import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:nps_masspa/api/api_response.dart';
import 'package:nps_masspa/api/masspa_api.dart';
import 'package:nps_masspa/model/resource/emotion_resource.dart';
import 'package:nps_masspa/scopedmodel/base_model.dart';

class EmotionModel extends BaseModel {
    static sendEmotion(EmotionResource emotionResource, OnApiCallBack callback) async {
        Response response = await ApiService.sendEmotion(emotionResource);
        ApiResponse apiResponse = await compute(processResponseInBackground, response.body);
        callback(response, apiResponse);
    }
}