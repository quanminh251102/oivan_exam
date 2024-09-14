// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      badge_counts: json['badge_counts'] == null
          ? null
          : BadgeCountDto.fromJson(
              json['badge_counts'] as Map<String, dynamic>),
      account_id: (json['account_id'] as num?)?.toInt(),
      is_employee: json['is_employee'] as bool?,
      last_modified_date: (json['last_modified_date'] as num?)?.toInt(),
      last_access_date: (json['last_access_date'] as num?)?.toInt(),
      reputation_change_year: (json['reputation_change_year'] as num?)?.toInt(),
      reputation_change_quarter:
          (json['reputation_change_quarter'] as num?)?.toInt(),
      reputation_change_month:
          (json['reputation_change_month'] as num?)?.toInt(),
      reputation_change_week: (json['reputation_change_week'] as num?)?.toInt(),
      reputation_change_day: (json['reputation_change_day'] as num?)?.toInt(),
      reputation: (json['reputation'] as num?)?.toInt(),
      creation_date: (json['creation_date'] as num?)?.toInt(),
      user_type: json['user_type'] as String?,
      user_id: (json['user_id'] as num?)?.toInt(),
      accept_rate: (json['accept_rate'] as num?)?.toInt(),
      location: json['location'] as String?,
      website_url: json['website_url'] as String?,
      link: json['link'] as String?,
      profile_image: json['profile_image'] as String?,
      display_name: json['display_name'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'badge_counts': instance.badge_counts?.toJson(),
      'account_id': instance.account_id,
      'is_employee': instance.is_employee,
      'last_modified_date': instance.last_modified_date,
      'last_access_date': instance.last_access_date,
      'reputation_change_year': instance.reputation_change_year,
      'reputation_change_quarter': instance.reputation_change_quarter,
      'reputation_change_month': instance.reputation_change_month,
      'reputation_change_week': instance.reputation_change_week,
      'reputation_change_day': instance.reputation_change_day,
      'reputation': instance.reputation,
      'creation_date': instance.creation_date,
      'user_type': instance.user_type,
      'user_id': instance.user_id,
      'accept_rate': instance.accept_rate,
      'location': instance.location,
      'website_url': instance.website_url,
      'link': instance.link,
      'profile_image': instance.profile_image,
      'display_name': instance.display_name,
    };
