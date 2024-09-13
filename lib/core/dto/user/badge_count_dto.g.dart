// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badge_count_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BadgeCountDto _$BadgeCountDtoFromJson(Map<String, dynamic> json) =>
    BadgeCountDto(
      bronze: (json['bronze'] as num?)?.toInt(),
      silver: (json['silver'] as num?)?.toInt(),
      gold: (json['gold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BadgeCountDtoToJson(BadgeCountDto instance) =>
    <String, dynamic>{
      'bronze': instance.bronze,
      'silver': instance.silver,
      'gold': instance.gold,
    };
