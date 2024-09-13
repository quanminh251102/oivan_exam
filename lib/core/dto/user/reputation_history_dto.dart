import 'package:json_annotation/json_annotation.dart';

part 'reputation_history_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ReputationHistoryDto {
  String? reputationHistoryType;
  int? reputationChange;
  int? postId;
  int? creationDate;
  int? userId;

  ReputationHistoryDto(
      {this.reputationHistoryType,
      this.reputationChange,
      this.postId,
      this.creationDate,
      this.userId});

  factory ReputationHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$ReputationHistoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReputationHistoryDtoToJson(this);
}

class ReputationGroupByPost {
  int? postId;
  List<ReputationHistoryDto>? reputationList;

  ReputationGroupByPost({
    this.reputationList,
    this.postId,
  });
}
