// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReputationHistoryDto _$ReputationHistoryDtoFromJson(
        Map<String, dynamic> json) =>
    ReputationHistoryDto(
      reputationHistoryType: json['reputationHistoryType'] as String?,
      reputationChange: (json['reputationChange'] as num?)?.toInt(),
      postId: (json['postId'] as num?)?.toInt(),
      creationDate: (json['creationDate'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReputationHistoryDtoToJson(
        ReputationHistoryDto instance) =>
    <String, dynamic>{
      'reputationHistoryType': instance.reputationHistoryType,
      'reputationChange': instance.reputationChange,
      'postId': instance.postId,
      'creationDate': instance.creationDate,
      'userId': instance.userId,
    };
