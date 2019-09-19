
import 'package:nps_masspa/model/base_response.dart';
import 'branch.dart';

class BranchResponse extends BaseResponse{
  String spaCode;
  String role;
  List<Branch> branches;

  BranchResponse({this.spaCode, this.role, this.branches});

  BranchResponse.fromJson(Map<String, dynamic> json) {
    this.spaCode = json['spaCode'];
    this.role = json['role'];
    this.branches = (json['branches'] as List)!=null?(json['branches'] as List).map((i) => Branch.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['spaCode'] = this.spaCode;
    data['role'] = this.role;
    data['branches'] = this.branches != null?this.branches.map((i) => i.toJson()).toList():null;
    return data;
  }

}