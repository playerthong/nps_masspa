class LoginResource {
  String username;
  String password;
  String countryCode;
  String spaCode;
  String role;
  String branchCode;

  LoginResource({this.username, this.password, this.countryCode, this.spaCode, this.role, this.branchCode});

  LoginResource.fromJson(Map<String, dynamic> json) {    
    this.username = json['username'];
    this.password = json['password'];
    this.countryCode = json['countryCode'];
    this.spaCode = json['spaCode'];
    this.role = json['role'];
    this.branchCode = json['branchCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['countryCode'] = this.countryCode;
    data['spaCode'] = this.spaCode;
    data['role'] = this.role;
    data['branchCode'] = this.branchCode;
    return data;
  }

}
