class LoginResource {
  String username;
  String password;
  String companyCode;

  LoginResource({this.username, this.password, this.companyCode});

  LoginResource.fromJson(Map<String, dynamic> json) {    
    this.username = json['username'];
    this.password = json['password'];
    this.companyCode = json['companyCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['companyCode'] = this.companyCode;
    return data;
  }

}
