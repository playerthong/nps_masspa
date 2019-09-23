import 'package:flutter/material.dart';
import 'package:nps_masspa/generated/i18n.dart';
import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:nps_masspa/scopedmodel/login_model.dart';
import 'package:nps_masspa/storage/app_shared_perf_helper.dart';
import 'package:nps_masspa/utils/masspa_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nps_masspa/generated/i18n.dart';
import 'package:nps_masspa/utils/screen_helper.dart';
import 'package:nps_masspa/utils/string_utils.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:nps_masspa/utils/dimensions.dart';
import 'package:libphonenumber/libphonenumber.dart';

class LoginScreen extends BaseScreen {

  LoginScreen({Key key,  title}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}


class LoginState extends BaseState<LoginScreen> {

  LoginModel loginModel;

  final TextEditingController usernameController=new TextEditingController();
  final TextEditingController passwordController=new TextEditingController();
  final TextEditingController companyCodeController=new TextEditingController();

  String errorUsername="";
  String errorPassword="";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usernameController.dispose();
    passwordController.dispose();
    companyCodeController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    loginModel = new LoginModel();
    //usernameController.text="0932879813";
    //passwordController.text="123123";
    getPhoneNumberStorage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      padding: const EdgeInsets.only(top: 100.0, bottom: 10.0),
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
                              style: TextStyle(
                                color: Colors.black
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.phone,
                              controller: usernameController,
                              onSaved: (String val){
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: S.of(context).login_phone_hint,
                                hintStyle: TextStyle(color: Colors.grey),
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
                            Text(errorUsername,style: TextStyle(color:Colors.red))
                        ],
                      ),
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin, top: 8.0),
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
                              style: TextStyle(
                                color: Colors.black
                              ),
                              obscureText: true,
                              textAlign: TextAlign.center,
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your password',
                                hintStyle: TextStyle(color: Colors.grey),
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
                          Text(errorPassword,style: TextStyle(color:Colors.red))
                        ],
                      ),
                    ),
                    new Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: Dimensions.marginLeftRightLogin, right: Dimensions.marginLeftRightLogin, top: 8.0),
                      alignment: Alignment.center,
                      child: new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new FlatButton(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 20.0),
                              color: MasspaColor.primaryColor,
                              onPressed:
                                login
                              ,
                              child: Text(
                                "Đăng Nhập",
                                style: TextStyle(color: Colors.white,fontSize: 22),
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
                                //"Forgot your password?",
                                '',
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

  void getPhoneNumberStorage() async {
    String phoneNumber = await AppSharedPrefHelper.getPhoneNumber();
    if (!StringUtils.isEmpty(phoneNumber)) {
      usernameController.text = phoneNumber;
    }
  }


  void login() async{
    String username=usernameController.text;
    String password=passwordController.text;
    String countryCode="";
    errorUsername="";
    errorPassword="";
    if(username==null || username.isEmpty){
      setState(() {
        errorUsername="*Bạn chưa nhập số điện thoại.";
      });
      return;
    }
    if(password==null || password.isEmpty){
      setState(() {
        errorPassword="*Bạn chưa mật khẩu.";
      });
      return;
    }
    String prefix=username.substring(0,1);
    if(prefix!="+"){
      username="+84"+username;
    }
    bool isValid= await PhoneNumberUtil.isValidPhoneNumber(phoneNumber: username,isoCode: 'US');

    if(!isValid){
      errorUsername="Số điện thoại của bạn không hợp lệ.";
      return;
    }
    String normalizedNumber = await PhoneNumberUtil.normalizePhoneNumber(
        phoneNumber: username, isoCode: 'US');
    RegionInfo regionInfo =
    await PhoneNumberUtil.getRegionInfo(phoneNumber: username, isoCode: 'US');
    username=regionInfo.formattedPhoneNumber;
    countryCode="+"+regionInfo.regionPrefix;
    showProgressDialog();
    LoginResource loginResource=new LoginResource(username: username,password: password,countryCode: countryCode);
    LoginModel.login(loginResource,(httpResponse,apiResponse) async  {
        hideProgressDialog();
        if(apiResponse.isSuccess()){

        }else{
          //get list branch
          if(apiResponse.error==1167){
            print(apiResponse.data);
            BranchResponse branchResponse = BranchResponse.fromJson(apiResponse.data);
            ScreenHelper.goToSelectBranch(context,true, branchResponse, loginResource);
            //go to branch screen
          }
        }
    });

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