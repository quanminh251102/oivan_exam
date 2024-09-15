// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'reputation_history_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ReputationHistoryDto {
  String? reputation_history_type;
  int? reputation_change;
  int? post_id;
  int? creation_date;
  int? user_id;
  ReputationHistoryDto({
    this.reputation_history_type,
    this.reputation_change,
    this.post_id,
    this.creation_date,
    this.user_id,
  });

  factory ReputationHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$ReputationHistoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReputationHistoryDtoToJson(this);
}

class ReputationGroupByTime {
  DateTime? time;
  List<ReputationHistoryDto>? reputationList;

  ReputationGroupByTime({
    this.time,
    this.reputationList,
  });
}
