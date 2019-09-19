import 'package:nps_masspa/model/service.dart';
import 'package:nps_masspa/model/user.dart';

import 'branch.dart';

class LoginResponse {
  String token;
  Branch branch;
  Service service;
  User user;

  LoginResponse({this.token, this.branch, this.service, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {    
    this.token = json['token'];
    this.branch = json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    this.service = json['service'] != null ? Service.fromJson(json['service']) : null;
    this.user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.branch != null) {
      data['branch'] = this.branch.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }

}





