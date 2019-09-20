import 'dart:core' as core;

import 'package:nps_masspa/utils/constants.dart';

class LogUtils {
    static void printLog(core.Object message) {
        if (Constants.ENV != Environment.PROD) {
            core.print(message);
        }
    }
}