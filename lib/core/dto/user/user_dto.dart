import 'package:json_annotation/json_annotation.dart';
import 'package:oivan_exam/core/dto/user/badge_count_dto.dart';
part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  BadgeCountDto? badge_counts;
  int? account_id;
  bool? is_employee;
  int? last_modified_date;
  int? last_access_date;
  int? reputation_change_year;
  int? reputation_change_quarter;
  int? reputation_change_month;
  int? reputation_change_week;
  int? reputation_change_day;
  int? reputation;
  int? creation_date;
  String? user_type;
  int? user_id;
  int? accept_rate;
  String? location;
  String? website_url;
  String? link;
  String? profile_image;
  String? display_name;
  bool? isBookmarked;
  UserDto(
      {this.badge_counts,
      this.account_id,
      this.is_employee,
      this.last_modified_date,
      this.last_access_date,
      this.reputation_change_year,
      this.reputation_change_quarter,
      this.reputation_change_month,
      this.reputation_change_week,
      this.reputation_change_day,
      this.reputation,
      this.creation_date,
      this.user_type,
      this.user_id,
      this.accept_rate,
      this.location,
      this.website_url,
      this.link,
      this.profile_image,
      this.display_name,
      this.isBookmarked});

  UIUserDto clone() {
    return UIUserDto(
      badgeCounts: badge_counts,
      accountId: account_id,
      isEmployee: is_employee,
      lastModifiedDate: last_modified_date,
      lastAccessDate: last_access_date,
      reputationChangeYear: reputation_change_year,
      reputationChangeQuarter: reputation_change_quarter,
      reputationChangeMonth: reputation_change_month,
      reputationChangeWeek: reputation_change_week,
      reputationChangeDay: reputation_change_day,
      reputation: reputation,
      creationDate: creation_date,
      userType: user_type,
      userId: user_id,
      acceptRate: accept_rate,
      location: location,
      websiteUrl: website_url,
      link: link,
      profileImage: profile_image,
      displayName: display_name,
      isBookmarked: isBookmarked,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

class UIUserDto {
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
  bool? isBookmarked;
  UIUserDto({
    this.badgeCounts,
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
    this.displayName,
    this.isBookmarked,
  });
}
