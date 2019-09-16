import 'package:flutter/material.dart';
import 'package:nps_masspa/generated/i18n.dart';
import 'package:nps_masspa/scopedmodel/login_model.dart';
import 'package:nps_masspa/utils/masspa_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nps_masspa/generated/i18n.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:nps_masspa/utils/dimensions.dart';


class LoginScreen extends BaseScreen {

  LoginScreen({Key key,  title}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}


class LoginState extends BaseState<LoginScreen> {

  LoginModel loginModel;

  TextEditingController usernameController=new TextEditingController();
  TextEditingController passwordController=new TextEditingController();
  TextEditingController companyCodeController=new TextEditingController();

  @override
  void initState() {
    loginModel = new LoginModel();
  }

  @override
  Widget build(BuildContext context) {
    if(pr==null){
      pr = new ProgressDialog(context, ProgressDialogType.Normal);
      pr.setMessage(S.of(context).please_wait);
    }
   // _showDialog();
    return Scaffold(
        backgroundColor: MasspaColor.primaryColor,
        resizeToAvoidBottomPadding: false, //void overflow screen
        body: Center(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment.centerLeft,
                  end: new Alignment(1.0, 0.0),
                  // 10% of the width, so there are ten blinds.
                  colors: [Colors.white, Colors.white],
                  // whitish to gray
                  tileMode: TileMode
                      .repeated, // repeats the gradient over the canvas
                ),
              ),
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child:Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 100.0, bottom: 30.0),
                      child: Center(
                        child: new Column(
                          children: <Widget>[
                            Container(
                              height: 128.0,
                              width: 128.0,
                              child: Image.asset("assets/ic_logo.png", fit: BoxFit.contain),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                                shape: BoxShape.circle,
                                //image: DecorationImage(image: this.logo)
                              ),
                            ),
                            new Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: new Text(
                                S.of(context).login_title,
                                style: TextStyle(color: Colors.black,fontSize:16 ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MasspaColor.grayColor,
                        borderRadius: new BorderRadius.all(new Radius.circular(Dimensions.roundRadius)),
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 8,top: 8,bottom: 8),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              controller: usernameController,
                              onSaved: (String val){
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: S.of(context).login_phone_hint,
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin),
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8,top: 8,bottom: 8),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text('*Hello',style: TextStyle(color:Colors.red))
                        ],
                      ),
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin, top: 30.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MasspaColor.grayColor,
                        borderRadius: new BorderRadius.all(new Radius.circular(Dimensions.roundRadius)),
                      ),
                      padding: const EdgeInsets.only(left: 8, right: 8,top: 8,bottom: 8),
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Expanded(
                            child: TextFormField(
                              obscureText: true,
                              textAlign: TextAlign.center,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '*********',
                                hintStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin, top: 30.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.white,
                              onPressed:
                                login
                              ,
                              child: Text(
                                "Log In",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              onPressed: () => {},
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Expanded(
                      child:new Column()
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: 40.0, right: 40.0, top: 10.0, bottom: 20.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: Colors.transparent,
                              onPressed: () => {},
                              child: Text(
                                "Copyright by @Masspa",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )

            )
        )
    );
  }

  void login() {
    if (formKey.currentState.validate()) {
      showProgressDialog();

      loginModel.login("sdfds", "sdfds", "sdfdf",(httpResponse,apiResponse) async {
        hideProgressDialog();
        showAlertDialog( "Em ok");
        if(apiResponse.success){

        }else{

        }
      });
    }
  }

  void _showDialog() {
    //pr.show();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(S.of(context).please_wait),
            content: Text(S.of(context).welcome),

          );
        });

  }
}