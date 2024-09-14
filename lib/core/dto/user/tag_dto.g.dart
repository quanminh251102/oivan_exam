// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagDto _$TagDtoFromJson(Map<String, dynamic> json) => TagDto(
      user_id: (json['user_id'] as num?)?.toInt(),
      answer_count: (json['answer_count'] as num?)?.toInt(),
      answer_score: (json['answer_score'] as num?)?.toInt(),
      question_count: (json['question_count'] as num?)?.toInt(),
      question_score: (json['question_score'] as num?)?.toInt(),
      tag_name: json['tag_name'] as String?,
    );

Map<String, dynamic> _$TagDtoToJson(TagDto instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'answer_count': instance.answer_count,
      'answer_score': instance.answer_score,
      'question_count': instance.question_count,
      'question_score': instance.question_score,
      'tag_name': instance.tag_name,
    };
