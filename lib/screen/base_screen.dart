import 'package:flutter/material.dart';
import 'package:nps_masspa/utils/string_utils.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:nps_masspa/generated/l10n.dart';

abstract class BaseScreen extends StatefulWidget {
  final String title;

  BaseScreen({Key key, this.title}) : super(key: key);
}

abstract class BaseState<T extends BaseScreen> extends State<T> {
  ProgressDialog progressDialog;
  AlertDialog alertDialog;
  final formKey = GlobalKey<FormState>();

  void showProgressDialog({String message}) {
    if (progressDialog == null) {
      progressDialog = new ProgressDialog(context, ProgressDialogType.Normal);
    }
    if (!StringUtils.isEmpty(message)) {
      progressDialog.setMessage(message);
    }
    progressDialog.show();
  }

  void hideProgressDialog() {
      if (progressDialog != null) {
        progressDialog.hide();
        progressDialog = null;
      }
  }

  void showAlertWithTitleDialog(String title, String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        alertDialog = AlertDialog(
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

  void showAlertDialog(String body) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        alertDialog = AlertDialog(
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

  void hideAlertDialog() {
    if (alertDialog != null && context != null) {
      alertDialog = null;
      Navigator.of(context).pop();
    }
  }
}
