import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nps_masspa/generated/l10n.dart';
import 'package:nps_masspa/scopedmodel/nps_masspa_model.dart';
import 'package:nps_masspa/screen/splash_screen.dart';
import 'package:nps_masspa/utils/constants.dart';
import 'package:scoped_model/scoped_model.dart';

void main() =>() {
  Constants.setEnvironment(Environment.PROD);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(NPSMasspaApp());
};


class NPSMasspaApp extends StatefulWidget {


  @override
  NPSMasspaAppState createState() {
    return NPSMasspaAppState();
  }

}

class NPSMasspaAppState extends State<NPSMasspaApp>{
  NPSMasspaAppModel appModel;


  @override
  void initState() {
    appModel=new NPSMasspaAppModel();
  }

  @override
  Widget build(BuildContext context) {
    S.load(Locale('vi', 'VN'));
    return ScopedModel<NPSMasspaAppModel>(
        model: appModel,
        child: ScopedModelDescendant<NPSMasspaAppModel>(
            builder: (context, child, model) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.red,
                ),
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  S.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                title: 'NPS'+Constants.ENV,
                home: SplashScreen(title: 'Masspa NPS'),
              );
            }
        ));
  }

}


