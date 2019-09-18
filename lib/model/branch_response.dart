import 'package:nps_masspa/model/base_response.dart';


class BranchResponse {
  String serviceCode;
  String branchCode;
  String branchName;
  String imageUrl;
  String imageGallery;
  String lat;
  String lng;
  String country;
  String state;
  String address;
  String city;
  String district;
  String phone;
  String mobile;
  String countryCode;
  String createdAt;
  int isMain;
  num updatedAt;

  BranchResponse({this.serviceCode, this.branchCode, this.branchName, this.imageUrl, this.imageGallery, this.lat, this.lng, this.country, this.state, this.address, this.city, this.district, this.phone, this.mobile, this.countryCode, this.createdAt, this.isMain, this.updatedAt});

  BranchResponse.fromJson(Map<String, dynamic> json) {
    this.serviceCode = json['serviceCode'];
    this.branchCode = json['branchCode'];
    this.branchName = json['branchName'];
    this.imageUrl = json['imageUrl'];
    this.imageGallery = json['imageGallery'];
    this.lat = json['lat'];
    this.lng = json['lng'];
    this.country = json['country'];
    this.state = json['state'];
    this.address = json['address'];
    this.city = json['city'];
    this.district = json['district'];
    this.phone = json['phone'];
    this.mobile = json['mobile'];
    this.countryCode = json['countryCode'];
    this.createdAt = json['createdAt'];
    this.isMain = json['isMain'];
    this.updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceCode'] = this.serviceCode;
    data['branchCode'] = this.branchCode;
    data['branchName'] = this.branchName;
    data['imageUrl'] = this.imageUrl;
    data['imageGallery'] = this.imageGallery;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['country'] = this.country;
    data['state'] = this.state;
    data['address'] = this.address;
    data['city'] = this.city;
    data['district'] = this.district;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['createdAt'] = this.createdAt;
    data['isMain'] = this.isMain;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
