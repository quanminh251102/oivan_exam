import 'package:json_annotation/json_annotation.dart';

part 'badge_count_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BadgeCountDto {
  int? bronze;
  int? silver;
  int? gold;

  BadgeCountDto({
    this.bronze,
    this.silver,
    this.gold,
  });

  factory BadgeCountDto.fromJson(Map<String, dynamic> json) =>
      _$BadgeCountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BadgeCountDtoToJson(this);
}
