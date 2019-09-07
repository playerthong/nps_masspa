// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..createdAt = json['createdAt'] == null
        ? null
        : BigInt.parse(json['createdAt'] as String)
    ..updatedAt = json['updatedAt'] == null
        ? null
        : BigInt.parse(json['updatedAt'] as String)
    ..username = json['username'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..gender = json['gender'] as String
    ..companyId = json['companyId'] as String
    ..companyCode = json['companyCode'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'createdAt': instance.createdAt?.toString(),
      'updatedAt': instance.updatedAt?.toString(),
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'gender': instance.gender,
      'companyId': instance.companyId,
      'companyCode': instance.companyCode,
    };
