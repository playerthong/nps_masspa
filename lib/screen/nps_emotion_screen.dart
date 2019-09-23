import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/resource/emotion_resource.dart';
import 'package:nps_masspa/model/service.dart';
import 'package:nps_masspa/scopedmodel/emotion_model.dart';
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:nps_masspa/utils/constants.dart';
import 'package:nps_masspa/utils/string_utils.dart';
import 'package:nps_masspa/storage/app_shared_perf_helper.dart';
import 'package:nps_masspa/utils/screen_helper.dart';
import 'package:nps_masspa/widget/emotion_logo_widget.dart';

typedef void EmotionClickListener(String emotion);

class NPSEmotionScreen extends BaseScreen {
  final Branch branch;
  final Service service;

  NPSEmotionScreen({Key key, title, this.branch, this.service}) : super(key: key);

  @override
  NPSEmotionState createState() {
    return NPSEmotionState();
  }
}

class NPSEmotionState extends BaseState<NPSEmotionScreen> {
  double sizeIcon = 100;
  bool isShowBannerThankYou = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Form(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 48.0),
                  child: EmotionLogoWidget(logoUrl: getLogoUrl())
                ),
                Expanded(
                  child: Center(
                      //fit: BoxFit.contain,
                      child: BannerEmotionCenterWidget(isShowBannerThankYou: isShowBannerThankYou, emotionClickListener: (emotion){
                        emotionClick(emotion);
                      })
                  )
                ),
                Container(
                width: MediaQuery.of(context).size.width,
                height: 64,
                padding: EdgeInsets.only(left: 16.0),
                color: Color(0xFFf44336),
                child: Row(
                  children: <Widget>[
                    Text(
                      getAddress(),
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Column(),
                    ),
                    InkWell(
                      child: Container(
                        height: 64.0,
                        width: 64.0,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        )
                      ),
                      onTap: (){
                        logoutClick();
                      },
                    )
                  ],
                ),
              )
            ],
          ))
        )
      )
    );
  }

  String getAddress() {
    if (widget.branch != null && !StringUtils.isEmpty(widget.branch.address)) {
      return widget.branch.branchName + ' | ' + widget.branch.address + '. Số điện thoại: ' + widget.branch.phone;
    }
    return '';
  }

  String getLogoUrl() {
    if (widget.service != null) {
      return widget.service.logo;
    }
    return '';
  }

  void logoutClick() async{
     AppSharedPrefHelper.setLoginResponse(null);
     ScreenHelper.goToLogin(context, true);
  }

  void emotionClick(String emotion) {
    Future.delayed(Duration(milliseconds: 200), (){
      setState(() {
        isShowBannerThankYou = true;
      });
    });

    EmotionResource resource = new EmotionResource();
    resource.emotion = emotion;
    resource.branchCode = widget.branch.branchCode;

    EmotionModel.sendEmotion(resource, (httpResponse, apiResponse) {
      if (apiResponse != null) {
        if (apiResponse.isSuccess()) {
          print('sendEmotionSuccess: ' + httpResponse.body);
        } else {
          print('sendEmotionFailed: ' + apiResponse.message);
        }
      }
    });

    Future.delayed(Duration(milliseconds: 4000), (){
      setState(() {
        isShowBannerThankYou = false;
      });
    });
  }
}

class BannerEmotionCenterWidget extends StatefulWidget {
  final EmotionClickListener emotionClickListener;
  final bool isShowBannerThankYou;

  BannerEmotionCenterWidget({Key key, this.isShowBannerThankYou, this.emotionClickListener}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BannerEmotionCenterWidgetState();
  }
}

class BannerEmotionCenterWidgetState extends State<BannerEmotionCenterWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isShowBannerThankYou) {
      return BannerThankYouWidget();
    }
    return EmotionWidget(emotionClickListener: widget.emotionClickListener);
  }
}

class EmotionWidget extends StatelessWidget {
  final EmotionClickListener emotionClickListener;
  final double sizeIcon = 100.0;

  EmotionWidget({Key key, this.emotionClickListener}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(0.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              hoverColor: Colors.greenAccent,
              highlightColor: Colors.redAccent,
              onTap: () {
                emotionClick(Emotion.ANGRY);
              },
              child: Image.asset(
                      "assets/ic_angry.png",
                      width: sizeIcon,
                      height: sizeIcon
              )
            ),
            InkWell(
                onTap: () {
                  emotionClick(Emotion.SAD);
                },
                child: Image.asset(
                    "assets/ic_sad.png",
                    width: sizeIcon,
                    height: sizeIcon
                )
            ),
            InkWell(
                onTap: () {
                  emotionClick(Emotion.NORMAL);
                },
                child: Image.asset(
                    "assets/ic_normal.png",
                    width: sizeIcon,
                    height: sizeIcon
                )
            ),
            InkWell(
              onTap: () {
                emotionClick(Emotion.HAPPY);
              },
              child: Image.asset(
                      "assets/ic_happy.png",
                      width: sizeIcon,
                      height: sizeIcon
              )
            ),
            InkWell(
              onTap: () {
                emotionClick(Emotion.LOVE);
              },
              child: Image.asset(
                      "assets/ic_love.png",
                      width: sizeIcon,
                      height: sizeIcon
              )
            )
          ]
        ),
        Expanded(flex: 2,child: Padding(padding: EdgeInsets.all(0.0)))
      ],
    );
  }

  void emotionClick(String emotion) {
    if (emotionClickListener != null) {
      emotionClickListener(emotion);
    }
  }
}

class BannerThankYouWidget extends StatelessWidget {
  BannerThankYouWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row()
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Cảm ơn quý khách!',
            style: TextStyle(
                    color: Colors.red, fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Chúc quý khách một ngày vui vẻ.',
            style: TextStyle(
                    color: Colors.red, fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row()
        )
    ]);
  }
}
