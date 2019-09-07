import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';


@JsonSerializable()
class User{

  BigInt createdAt;
  BigInt updatedAt;
  String _id;
  String username;
  String name;
  String email;
  String gender;
  String companyId;
  String companyCode;

}