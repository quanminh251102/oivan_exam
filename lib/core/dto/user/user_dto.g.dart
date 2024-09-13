// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      badgeCounts: json['badgeCounts'] == null
          ? null
          : BadgeCountDto.fromJson(json['badgeCounts'] as Map<String, dynamic>),
      accountId: (json['accountId'] as num?)?.toInt(),
      isEmployee: json['isEmployee'] as bool?,
      lastModifiedDate: (json['lastModifiedDate'] as num?)?.toInt(),
      lastAccessDate: (json['lastAccessDate'] as num?)?.toInt(),
      reputationChangeYear: (json['reputationChangeYear'] as num?)?.toInt(),
      reputationChangeQuarter:
          (json['reputationChangeQuarter'] as num?)?.toInt(),
      reputationChangeMonth: (json['reputationChangeMonth'] as num?)?.toInt(),
      reputationChangeWeek: (json['reputationChangeWeek'] as num?)?.toInt(),
      reputationChangeDay: (json['reputationChangeDay'] as num?)?.toInt(),
      reputation: (json['reputation'] as num?)?.toInt(),
      creationDate: (json['creationDate'] as num?)?.toInt(),
      userType: json['userType'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      acceptRate: (json['acceptRate'] as num?)?.toInt(),
      location: json['location'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      link: json['link'] as String?,
      profileImage: json['profileImage'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'badgeCounts': instance.badgeCounts?.toJson(),
      'accountId': instance.accountId,
      'isEmployee': instance.isEmployee,
      'lastModifiedDate': instance.lastModifiedDate,
      'lastAccessDate': instance.lastAccessDate,
      'reputationChangeYear': instance.reputationChangeYear,
      'reputationChangeQuarter': instance.reputationChangeQuarter,
      'reputationChangeMonth': instance.reputationChangeMonth,
      'reputationChangeWeek': instance.reputationChangeWeek,
      'reputationChangeDay': instance.reputationChangeDay,
      'reputation': instance.reputation,
      'creationDate': instance.creationDate,
      'userType': instance.userType,
      'userId': instance.userId,
      'acceptRate': instance.acceptRate,
      'location': instance.location,
      'websiteUrl': instance.websiteUrl,
      'link': instance.link,
      'profileImage': instance.profileImage,
      'displayName': instance.displayName,
    };
