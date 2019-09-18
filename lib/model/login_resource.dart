class LoginResource {
  String username;
  String password;
  String countryCode;

  LoginResource({this.username, this.password, this.countryCode});

  LoginResource.fromJson(Map<String, dynamic> json) {    
    this.username = json['username'];
    this.password = json['password'];
    this.countryCode = json['countryCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['countryCode'] = this.countryCode;
    return data;
  }

}
