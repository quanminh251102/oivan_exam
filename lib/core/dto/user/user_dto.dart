import 'package:json_annotation/json_annotation.dart';
import 'package:oivan_exam/core/dto/user/badge_count_dto.dart';
part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  BadgeCountDto? badgeCounts;
  int? accountId;
  bool? isEmployee;
  int? lastModifiedDate;
  int? lastAccessDate;
  int? reputationChangeYear;
  int? reputationChangeQuarter;
  int? reputationChangeMonth;
  int? reputationChangeWeek;
  int? reputationChangeDay;
  int? reputation;
  int? creationDate;
  String? userType;
  int? userId;
  int? acceptRate;
  String? location;
  String? websiteUrl;
  String? link;
  String? profileImage;
  String? displayName;

  UserDto(
      {this.badgeCounts,
      this.accountId,
      this.isEmployee,
      this.lastModifiedDate,
      this.lastAccessDate,
      this.reputationChangeYear,
      this.reputationChangeQuarter,
      this.reputationChangeMonth,
      this.reputationChangeWeek,
      this.reputationChangeDay,
      this.reputation,
      this.creationDate,
      this.userType,
      this.userId,
      this.acceptRate,
      this.location,
      this.websiteUrl,
      this.link,
      this.profileImage,
      this.displayName});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
