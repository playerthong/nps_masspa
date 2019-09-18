
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Branch {
  String serviceCode;
  String branchCode;
  String branchName;
  String imageUrl;
  String country;
  String countryCode;
  String phone;
  String mobile;
  String city;
  String district;
  String state;
  String address;
  String lat;
  String lng;
  List<String> imageGallery;

  BigInt createdAt;
  BigInt updatedAt;
  bool isSelected;
}