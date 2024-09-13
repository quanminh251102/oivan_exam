import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';

abstract class IProfileViewModel implements ChangeNotifier {
  List<ReputationGroupByPost> get reputationGroupByPost;
  Future<void> getUserReputation(int userId);
}
