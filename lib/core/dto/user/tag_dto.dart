// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'tag_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class TagDto {
  int? user_id;
  int? answer_count;
  int? answer_score;
  int? question_count;
  int? question_score;
  String? tag_name;
  TagDto({
    this.user_id,
    this.answer_count,
    this.answer_score,
    this.question_count,
    this.question_score,
    this.tag_name,
  });

  factory TagDto.fromJson(Map<String, dynamic> json) => _$TagDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TagDtoToJson(this);
}
