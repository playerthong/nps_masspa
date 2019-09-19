
class Service{
  String address;
  String countryCode;
  String currencyCode;
  String name;
  String no;
  String phone;
  String support;
  String website;
  String userCode;
  String ownerName;
  String mobile;
  String discount;
  String imageUrl;
  String description;
  String lat;
  String lng;
  String city;
  String district;
  String country;
  String state;
  String workingDays;
  String logo;
  int isActive;
  int catServiceId;
  int minPrice;
  int maxPrice;
  int rating;
  int pointSystem;
  int usingTax;
  num createdAt;
  num updatedAt;

  Service({this.address, this.countryCode, this.currencyCode, this.name, this.no, this.phone, this.support, this.website, this.userCode, this.ownerName, this.mobile, this.discount, this.imageUrl, this.description, this.lat, this.lng, this.city, this.district, this.country, this.state, this.workingDays, this.logo, this.isActive, this.catServiceId, this.minPrice, this.maxPrice, this.rating, this.pointSystem, this.usingTax, this.createdAt, this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    this.address = json['address'];
    this.countryCode = json['countryCode'];
    this.currencyCode = json['currencyCode'];
    this.name = json['name'];
    this.no = json['no'];
    this.phone = json['phone'];
    this.support = json['support'];
    this.website = json['website'];
    this.userCode = json['userCode'];
    this.ownerName = json['ownerName'];
    this.mobile = json['mobile'];
    this.discount = json['discount'];
    this.imageUrl = json['imageUrl'];
    this.description = json['description'];
    this.lat = json['lat'];
    this.lng = json['lng'];
    this.city = json['city'];
    this.district = json['district'];
    this.country = json['country'];
    this.state = json['state'];
    this.workingDays = json['workingDays'];
    this.logo = json['logo'];
    this.isActive = json['isActive'];
    this.catServiceId = json['catServiceId'];
    this.minPrice = json['minPrice'];
    this.maxPrice = json['maxPrice'];
    this.rating = json['rating'];
    this.pointSystem = json['pointSystem'];
    this.usingTax = json['usingTax'];
    this.createdAt = json['createdAt'];
    this.updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['countryCode'] = this.countryCode;
    data['currencyCode'] = this.currencyCode;
    data['name'] = this.name;
    data['no'] = this.no;
    data['phone'] = this.phone;
    data['support'] = this.support;
    data['website'] = this.website;
    data['userCode'] = this.userCode;
    data['ownerName'] = this.ownerName;
    data['mobile'] = this.mobile;
    data['discount'] = this.discount;
    data['imageUrl'] = this.imageUrl;
    data['description'] = this.description;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['city'] = this.city;
    data['district'] = this.district;
    data['country'] = this.country;
    data['state'] = this.state;
    data['workingDays'] = this.workingDays;
    data['logo'] = this.logo;
    data['isActive'] = this.isActive;
    data['catServiceId'] = this.catServiceId;
    data['minPrice'] = this.minPrice;
    data['maxPrice'] = this.maxPrice;
    data['rating'] = this.rating;
    data['pointSystem'] = this.pointSystem;
    data['usingTax'] = this.usingTax;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}