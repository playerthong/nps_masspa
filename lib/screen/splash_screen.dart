import 'package:flutter/material.dart';
import 'package:nps_masspa/generated/i18n.dart';
import 'package:nps_masspa/scopedmodel/splash_model.dart';
import 'package:nps_masspa/utils/masspa_color.dart';
import 'package:nps_masspa/utils/circle_loading.dart';

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


class SplashState extends State<SplashScreen>{

  SplashModel splashModel;


  @override
  void initState() {
    splashModel=new SplashModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MasspaColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/ic_masspa.png", fit: BoxFit.contain),
            CircleLoading(
              color: Colors.white,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

}