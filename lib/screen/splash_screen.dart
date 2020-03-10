import 'dart:developer';
import 'package:nps_masspa/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:nps_masspa/model/login_response.dart';
import 'package:nps_masspa/scopedmodel/splash_model.dart';
import 'package:nps_masspa/storage/app_shared_perf_helper.dart';
import 'package:nps_masspa/utils/circle_loading.dart';
import 'package:nps_masspa/utils/masspa_color.dart';
import 'package:nps_masspa/utils/screen_helper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  SplashModel splashModel;

  @override
  void initState() {
    splashModel = new SplashModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLoginSession();
      log('Build Splash Screen');
    });
    return Scaffold(
      backgroundColor: MasspaColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 156.0,
              width: 156.0,
              child: Image.asset("assets/ic_masspa.png", fit: BoxFit.contain),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.0,
                ),
                //image: DecorationImage(image: this.logo)
              ),
            ),
            new Padding(
                padding: const EdgeInsets.all(24.0),
                child: CircleLoading(
                  color: Colors.white,
                  size: 50.0,
                ))
          ],
        ),
      ),
    );
  }

  void checkLoginSession() async {
    LoginResponse loginResponse = await AppSharedPrefHelper.getLoginResponse();
    if (loginResponse != null && loginResponse.branch != null) {
      ScreenHelper.gotoEmotionScreen(context, true, loginResponse.branch, loginResponse.service);
    } else {
      ScreenHelper.goToLogin(context, true);
    }
  }
}
