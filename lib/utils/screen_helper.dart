import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/screen/login_screen.dart';
import 'package:nps_masspa/screen/nps_choose_branch_screen.dart';
import 'package:nps_masspa/screen/nps_emotion_screen.dart';


class ScreenHelper{

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

  static Future gotoMoodScreen(BuildContext context, bool isPopPreviousScreen, Branch branch) {
    if (isPopPreviousScreen) {
      return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NPSEmotionScreen(branch: branch)));
    } else {
      return Navigator.push(context, MaterialPageRoute(builder: (context) => NPSEmotionScreen(branch: branch)));
    }
  }
}