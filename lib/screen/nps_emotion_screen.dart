import 'package:flutter/material.dart';
import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/resource/emotion_resource.dart';
import 'package:nps_masspa/scopedmodel/emotion_model.dart';
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:nps_masspa/utils/constants.dart';
import 'package:nps_masspa/utils/string_utils.dart';
import 'package:toast/toast.dart';

class NPSEmotionScreen extends BaseScreen {
  final Branch branch;
  final bool isShowBannerThankYou = false;

  NPSEmotionScreen({Key key, title, this.branch}) : super(key: key);

  @override
  NPSEmotionState createState() {
    return NPSEmotionState();
  }
}

class NPSEmotionState extends BaseState<NPSEmotionScreen> {
  double sizeIcon = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Form(
              child: Column(
            children: <Widget>[
              Container(
                //padding: EdgeInsets.only(top: 48.0),
                child: Image.asset(
                  'assets/ic_logo.png',
                  height: 128.0,
                  width: 128.0,
                ),
              ),
              Expanded(
                  child: Center(
                      //fit: BoxFit.contain,
                      child: BannerEmotionCenterWidget(
                          isShowBannerThankYou: true))),
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
                    Container(
                      height: 64.0,
                      width: 64.0,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  String getAddress() {
    if (widget.branch != null && !StringUtils.isEmpty(widget.branch.address)) {
      return widget.branch.address + '. Số điện thoại: ' + widget.branch.phone;
    }
    return '';
  }

  void showText() {}

  void emotionClick(String emotion) {
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
  }
}

class BannerEmotionCenterWidget extends StatefulWidget {
  final bool isShowBannerThankYou;

  BannerEmotionCenterWidget({Key key, this.isShowBannerThankYou}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BannerEmotionCenterWidgetState();
  }
}

class BannerEmotionCenterWidgetState extends State<BannerEmotionCenterWidget> {
  double sizeIcon = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isShowBannerThankYou) {
      //Future.delayed(Duration(milliseconds: 5000), () {});
      return BannerThankYouWidget();
    }
    return EmotionWidget();
  }
}

class EmotionWidget extends StatelessWidget {
  final double sizeIcon = 100.0;

  EmotionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
        onTap: () {
          emotionClick(Emotion.ANGRY);
        },
        child: Image.asset("assets/ic_angry.png",
            width: sizeIcon, height: sizeIcon),
      ),
      GestureDetector(
        onTap: () {
          emotionClick(Emotion.HAPPY);
        },
        child: Image.asset("assets/ic_happy.png",
            width: sizeIcon, height: sizeIcon),
      ),
      GestureDetector(
        onTap: () {
          emotionClick(Emotion.LOVE);
        },
        child: Image.asset("assets/ic_love.png",
            width: sizeIcon, height: sizeIcon),
      ),
      GestureDetector(
        onTap: () {
          emotionClick(Emotion.NORMAL);
        },
        child: Image.asset("assets/ic_normal.png",
            width: sizeIcon, height: sizeIcon),
      ),
      GestureDetector(
        onTap: () {
          emotionClick(Emotion.SAD);
        },
        child:
            Image.asset("assets/ic_sad.png", width: sizeIcon, height: sizeIcon),
      )
    ]);
  }

  void emotionClick(String emotion) {}
}

class BannerThankYouWidget extends StatelessWidget {
  BannerThankYouWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Row()
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Cảm ơn quý khách!',
            style: TextStyle(
                    color: Colors.black, fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(24.0),
          child: Text(
            'Chúc quý khách một ngày vui vẻ.',
            style: TextStyle(
                    color: Colors.black, fontSize: 32.0, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Row()
        )
    ]);
  }
}
