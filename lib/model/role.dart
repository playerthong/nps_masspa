

class Role{
  String role;
  String spaCode;
  String spaName;
  String branchCode;
  String branchName;
  int loginFrontend;
  int loginAdmin;
  List<RolesListBean> roles;

  Role({this.role, this.spaCode, this.spaName, this.branchCode, this.branchName, this.loginFrontend, this.loginAdmin, this.roles});

  Role.fromJson(Map<String, dynamic> json) {
    this.role = json['role'];
    this.spaCode = json['spaCode'];
    this.spaName = json['spaName'];
    this.branchCode = json['branchCode'];
    this.branchName = json['branchName'];
    this.loginFrontend = json['loginFrontend'];
    this.loginAdmin = json['loginAdmin'];
    this.roles = (json['roles'] as List)!=null?(json['roles'] as List).map((i) => RolesListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['spaCode'] = this.spaCode;
    data['spaName'] = this.spaName;
    data['branchCode'] = this.branchCode;
    data['branchName'] = this.branchName;
    data['loginFrontend'] = this.loginFrontend;
    data['loginAdmin'] = this.loginAdmin;
    data['roles'] = this.roles != null?this.roles.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class RolesListBean {
  String role;
  String spaCode;

  RolesListBean({this.role, this.spaCode});

  RolesListBean.fromJson(Map<String, dynamic> json) {
    this.role = json['role'];
    this.spaCode = json['spaCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['spaCode'] = this.spaCode;
    return data;
  }
}