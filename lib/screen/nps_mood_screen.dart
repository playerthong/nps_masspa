import 'package:flutter/material.dart';
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:toast/toast.dart';

class NPSMoodScreen extends BaseScreen {
  NPSMoodScreen({Key key, title}) : super(key: key);

  @override
  NPSMoodState createState() => NPSMoodState();
}

class NPSMoodState extends BaseState<NPSMoodScreen> {
  double sizeIcon = 100;

  @override
  void initState() {
    // TODO: implement initState
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
                  child: Image.asset('assets/ic_logo.png', height: 128.0, width: 128.0,),
                ),
                Expanded(
                  child: Center(
                    //fit: BoxFit.contain,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('Angry Clicked');
                            showToast('Angry Clicked');
                          },
                          child: Image.asset("assets/ic_angry.png", width: sizeIcon, height: sizeIcon),
                        ),
                        GestureDetector(
                          onTap: (){
                            showToast('Happy Clicked');
                          },
                          child: Image.asset("assets/ic_happy.png", width: sizeIcon, height: sizeIcon),
                        ),
                        GestureDetector(
                          onTap: (){
                            showToast('Love Clicked');
                          },
                          child: Image.asset("assets/ic_love.png", width: sizeIcon, height: sizeIcon),
                        ),
                        GestureDetector(
                          onTap: (){
                            showToast('Normal Clicked');
                          },
                          child: Image.asset("assets/ic_normal.png", width: sizeIcon, height: sizeIcon),
                        ),
                        GestureDetector(
                          onTap: (){
                            showToast('Sad Clicked');
                          },
                          child: Image.asset("assets/ic_sad.png", width: sizeIcon, height: sizeIcon),
                        )
                      ]
                    )
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
                        '114 Phan Văn Trị, Phường 2, Quận 5, Thành phố Hồ Chí Minh. Số điện thoại: 0269 3887 999',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Expanded(
                        child: Column(),
                      ),
                      Container(
                        height: 64.0,
                        width: 64.0,
                        alignment: Alignment.center,
                        child: Icon(Icons.exit_to_app, color: Colors.white,),
                      )
                    ],
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }

  void showText() {

  }

  void showSnackBarText(BuildContext context, String text) {
    SnackBar snackBar = SnackBar(content: Text(text),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void showToast(String textMessage) {
    Toast.show(textMessage, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}
