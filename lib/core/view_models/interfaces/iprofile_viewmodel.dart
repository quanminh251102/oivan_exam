import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';

abstract class IProfileViewModel implements ChangeNotifier {
  List<ReputationGroupByTime> get reputationGroupByTime;
  List<ReputationHistoryDto> get reputations;
  List<TagDto> get tags;
  Future<void> getUserReputation(int userId);
  Future<void> getMoreReputation(int userId);
  Future<void> getUserTopTags(int userId);
}
