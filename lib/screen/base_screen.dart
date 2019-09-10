import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:nps_masspa/generated/i18n.dart';

abstract class BaseScreen extends StatefulWidget {
  String title;
  BaseScreen({Key key, this.title}) : super(key: key);

}

abstract class BaseState<T extends BaseScreen> extends State<T> {
  ProgressDialog pr;
  AlertDialog alertDialog;
  final formKey = GlobalKey<FormState>();

  void showProgressDialog(){
    if(pr!=null && !pr.isShowing()){
      pr.show();
    }
  }
  void hideProgressDialog(){
    if(pr!=null && pr.isShowing()){
      pr.hide();
    }
  }

  void showAlertWithTitleDialog(String title,String body){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          alertDialog= AlertDialog(
            title: new Text(title),
            content: new Text(body),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text(S.of(context).close),
                onPressed: () {
                  hideAlertDialog();
                },
              ),
            ],
          );
          return alertDialog;
        },
      );
  }

  void showAlertDialog(String body){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        alertDialog= AlertDialog(
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(S.of(context).close),
              onPressed: () {
                hideAlertDialog();
              },
            ),
          ],
        );
        return alertDialog;
      },
    );
  }

  void hideAlertDialog(){
    if(alertDialog!=null && context!=null){
      alertDialog=null;
      Navigator.of(context).pop();
    }
  }

}