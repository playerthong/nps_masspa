import 'package:flutter/material.dart';
import 'package:nps_masspa/model/branch.dart';
import 'package:nps_masspa/model/branch_response.dart';
import 'package:nps_masspa/model/login_resource.dart';
import 'package:nps_masspa/model/login_response.dart';
import 'package:nps_masspa/scopedmodel/login_model.dart';
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:nps_masspa/storage/app_shared_perf_helper.dart';
import 'package:nps_masspa/utils/screen_helper.dart';

typedef BranchClickListener = void Function(Branch branch);

class NPSChooseBranchScreen extends BaseScreen {
  final BranchResponse branchResponse;
  final LoginResource loginResource;

  NPSChooseBranchScreen(this.branchResponse, this.loginResource, {Key key, title}) : super(key: key);

  @override
  NPSChooseBranchState createState() {
    return NPSChooseBranchState();
  }
}

class NPSChooseBranchState extends BaseState<NPSChooseBranchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(24.0),
              child: Image.asset(
                'assets/ic_logo.png',
                height: 128.0,
                width: 128.0,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Choose your spa\'s branch',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Divider(height: 24.0, color: Colors.transparent,),
            Flexible(
              child: NPSBranchListWidget(objects: widget.branchResponse.branches, branchClickListener: selectBranch)
            )
          ],
        ),
      )
    );
  }

  void selectBranch(Branch branch) async {
    showProgressDialog();
    widget.loginResource.spaCode = widget.branchResponse.spaCode;
    widget.loginResource.branchCode = branch.branchCode;
    widget.loginResource.role = widget.branchResponse.role;

    LoginModel.login(widget.loginResource, (httpResponse, apiResponse) async {
      hideProgressDialog();
      if (apiResponse.isSuccess()) {
        print(apiResponse.data);
        if (apiResponse.data != null) {
          LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data);
          if (loginResponse != null) {
            AppSharedPrefHelper.setLoginResponse(loginResponse);
            AppSharedPrefHelper.setPhoneNumber(widget.loginResource.username);
            ScreenHelper.gotoEmotionScreen(context, true, loginResponse.branch, loginResponse.service);
          }
        }
      }
    });
  }
}

class NPSBranchListWidget extends StatefulWidget {
  final List<Branch> objects;
  final BranchClickListener branchClickListener;

  NPSBranchListWidget({Key key, this.objects, this.branchClickListener}) : super(key: key);

  @override
  NPSBranchListState createState() => NPSBranchListState();
}

class NPSBranchListState extends State<NPSBranchListWidget> {
  int oldIndexSelected = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.objects.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: EdgeInsets.only(left: 240.0, right: 240.0),
      itemBuilder: (BuildContext context, int index) {
        return NPSBranchItemWidget(branch: widget.objects[index], isSelected: false, callback: (){
          onItemSelected(widget.objects[index], index);
        });
      },
      separatorBuilder: (BuildContext context, int index){
        return Divider(
            height: 0.0,
            color: Colors.grey
        );
      },
    );
  }

  void onItemSelected(Branch branch, int index) {
    setState(() {
      if (oldIndexSelected > -1) {
        //widget.objects[oldIndexSelected].isSelected = false;
      }
      //branch.isSelected = true;
      oldIndexSelected = index;
    });
    if (widget.branchClickListener != null) {
      widget.branchClickListener(branch);
    }
  }
}

class NPSBranchItemWidget extends StatefulWidget {
  final bool isSelected;
  final Branch branch;
  final VoidCallback callback;

  NPSBranchItemWidget({ Key key, this.branch, this.isSelected, this.callback }) : super(key: key);

  @override
  NPSBranchItemWidgetState createState() {
    return NPSBranchItemWidgetState();
  }
}

class NPSBranchItemWidgetState extends State<NPSBranchItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(0.0),
      borderOnForeground: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
      clipBehavior: null,
      elevation: 0.0,
      child: InkWell(
        onTap: (){
          widget.callback();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
          child: Text(
            widget.branch.branchName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
      )
    );
  }
}
