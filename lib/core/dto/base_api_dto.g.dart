// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_api_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseApiDto<T> _$BaseApiDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseApiDto<T>(
      items: _$nullableGenericFromJson(json['items'], fromJsonT),
      has_more: json['has_more'] as bool?,
      quota_max: (json['quota_max'] as num?)?.toInt(),
      quota_remaining: (json['quota_remaining'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseApiDtoToJson<T>(
  BaseApiDto<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': _$nullableGenericToJson(instance.items, toJsonT),
      'has_more': instance.has_more,
      'quota_max': instance.quota_max,
      'quota_remaining': instance.quota_remaining,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
