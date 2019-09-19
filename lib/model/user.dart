
import 'package:nps_masspa/model/role.dart';

class User{
  String userCode;
  String socialId;
  String socialType;
  String typeAccount;
  String username;
  String firstName;
  String lastName;
  String email;
  String address;
  String countryCode;
  String dob;
  String googleUrl;
  String facebookUrl;
  String uidFireBase;
  String mobile;
  String nickName;
  String avatarImage;
  int isNotification;
  int active;
  int sex;
  num loginTime;
  num createdAt;
  num updatedAt;
  Role roleId;

  User({this.userCode, this.socialId, this.socialType, this.typeAccount, this.username, this.firstName, this.lastName, this.email, this.address, this.countryCode, this.dob, this.googleUrl, this.facebookUrl, this.uidFireBase, this.mobile, this.nickName, this.avatarImage, this.isNotification, this.active, this.sex, this.loginTime, this.createdAt, this.updatedAt, this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    this.userCode = json['userCode'];
    this.socialId = json['socialId'];
    this.socialType = json['socialType'];
    this.typeAccount = json['typeAccount'];
    this.username = json['username'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.email = json['email'];
    this.address = json['address'];
    this.countryCode = json['countryCode'];
    this.dob = json['dob'];
    this.googleUrl = json['googleUrl'];
    this.facebookUrl = json['facebookUrl'];
    this.uidFireBase = json['uidFireBase'];
    this.mobile = json['mobile'];
    this.nickName = json['nickName'];
    this.avatarImage = json['avatarImage'];
    this.isNotification = json['isNotification'];
    this.active = json['active'];
    this.sex = json['sex'];
    this.loginTime = json['loginTime'];
    this.createdAt = json['createdAt'];
    this.updatedAt = json['updatedAt'];
    this.roleId = json['roleId'] != null ? Role.fromJson(json['roleId']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCode'] = this.userCode;
    data['socialId'] = this.socialId;
    data['socialType'] = this.socialType;
    data['typeAccount'] = this.typeAccount;
    data['username'] = this.username;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['countryCode'] = this.countryCode;
    data['dob'] = this.dob;
    data['googleUrl'] = this.googleUrl;
    data['facebookUrl'] = this.facebookUrl;
    data['uidFireBase'] = this.uidFireBase;
    data['mobile'] = this.mobile;
    data['nickName'] = this.nickName;
    data['avatarImage'] = this.avatarImage;
    data['isNotification'] = this.isNotification;
    data['active'] = this.active;
    data['sex'] = this.sex;
    data['loginTime'] = this.loginTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.roleId != null) {
      data['roleId'] = this.roleId.toJson();
    }
    return data;
  }
}