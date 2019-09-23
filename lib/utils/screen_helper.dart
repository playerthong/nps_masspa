import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/model/service.dart';
import 'package:nps_masspa/screen/login_screen.dart';
import 'package:nps_masspa/screen/nps_choose_branch_screen.dart';
import 'package:nps_masspa/screen/nps_emotion_screen.dart';
import 'package:nps_masspa/screen/splash_screen.dart';

class ScreenHelper{

  static Future goToSplash(BuildContext context, bool isPopPreviousScreen) {
    if(isPopPreviousScreen){
      Future future=Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()),);
      return future;
    }else{
      Future future=Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen()),);
      return future;
    }
  }

  static Future goToSelectBranch(BuildContext context, bool isPopPreviousScreen,BranchResponse branchResponse,LoginResource loginResource) {
    if(isPopPreviousScreen){
      Future future=Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NPSChooseBranchScreen(branchResponse,loginResource)),);
      return future;
    }else{
      Future future=Navigator.push(context, MaterialPageRoute(builder: (context) => NPSChooseBranchScreen(branchResponse,loginResource)),);
      return future;
    }

  }

  static Future goToLogin(BuildContext context, bool isPopPreviousScreen) {
    if(isPopPreviousScreen){
      Future future=Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
      return future;
    }else{
      Future future=Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
      return future;
    }
  }

  static Future gotoEmotionScreen(BuildContext context, bool isPopPreviousScreen, Branch branch, Service service) {
    if (isPopPreviousScreen) {
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NPSEmotionScreen(branch: branch, service: service)));
    } else {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => NPSEmotionScreen(branch: branch, service: service)));
    }
  }
}