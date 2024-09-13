// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'base_api_dto.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class BaseApiDto<T> {
  T? items;
  @JsonKey(name: 'has_more')
  bool? has_more;
  @JsonKey(name: 'quota_max')
  int? quota_max;
  @JsonKey(name: 'quota_remaining')
  int? quota_remaining;
  BaseApiDto({
    this.items,
    this.has_more,
    this.quota_max,
    this.quota_remaining,
  });

  factory BaseApiDto.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseApiDtoFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseApiDtoToJson<T>(this, toJsonT);
}
