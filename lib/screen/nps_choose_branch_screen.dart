import 'package:flutter/material.dart';
import 'package:nps_masspa/model/branch_model.dart';
import 'package:nps_masspa/screen/base_screen.dart';
import 'package:toast/toast.dart';

class NPSChooseBranchScreen extends BaseScreen {
  NPSChooseBranchScreen({Key key, title}) : super(key: key);

  @override
  NPSChooseBranchState createState() {
    return NPSChooseBranchState();
  }
}

class NPSChooseBranchState extends BaseState<NPSChooseBranchScreen> {
  @override
  void initState() {
    super.initState();
    generateListBranch();
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
              child: NPSBranchListWidget(objects: generateListBranch()),
            )
          ],
        ),
      )
    );
  }

  List<Branch> generateListBranch() {
    List<Branch> objects = List();
    for (int i = 0; i < 10; i++) {
      Branch branch = new Branch();
      branch.branchName = 'Branch ' + (i + 1).toString();
      branch.isSelected = false;

      objects.add(branch);
    }
    return objects;
  }
}

class NPSBranchListWidget extends StatefulWidget {
  final List<Branch> objects;

  NPSBranchListWidget({Key key, this.objects}) : super(key: key);

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
        return NPSBranchItemWidget(branch: widget.objects[index], isSelected: widget.objects[index].isSelected, callback: (){
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
        widget.objects[oldIndexSelected].isSelected = false;
      }
      branch.isSelected = true;
      oldIndexSelected = index;
    });
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
    return GestureDetector(
      onTap: (){
        widget.callback();
      },
      child: Container(
        child: ListTile(
          contentPadding: EdgeInsets.all(0.0),
          title: Container(
            height: 64.0,
            alignment: Alignment.center,
            child: Text(
              widget.branch.branchName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
        decoration: widget.isSelected ? BoxDecoration(color: Colors.redAccent) : BoxDecoration(),
      ),
    );
  }
}
