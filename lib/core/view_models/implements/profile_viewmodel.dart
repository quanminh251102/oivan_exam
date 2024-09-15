import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/iprofile_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';

class ProfileViewModel with ChangeNotifier implements IProfileViewModel {
  final IUserService _iUserService = locator<IUserService>();

  List<ReputationHistoryDto> _reputations = [];

  List<ReputationGroupByTime> _reputationGroupByTime = [];
  @override
  List<ReputationGroupByTime> get reputationGroupByTime =>
      _reputationGroupByTime;

  final int _totalReputations = 0;
  final int _totalReputationGroupByPost = 0;
  int page = 1;

  List<TagDto> _tags = [];
  @override
  List<TagDto> get tags => _tags;

  void _resetReputation() {
    page = 1;
    _reputations.clear();
  }

  @override
  Future<void> getUserReputation(int userId) async {
    _resetReputation();
    final reputationList = await _iUserService.getUserReputation(
      userId: userId,
      page: 1,
      pageSize: 20,
      site: 'stackoverflow',
    );
    _reputations = reputationList ?? [];
    if (_reputations.isNotEmpty) {
      _reputationGroupByTime = groupReputationByTime(reputationList!);
    }
    notifyListeners();
  }

  List<ReputationGroupByTime> groupReputationByTime(
      List<ReputationHistoryDto> reputationHistoryList) {
    Map<DateTime, List<ReputationHistoryDto>> groupedByTime = {};

    for (var reputation in reputationHistoryList) {
      if (reputation.creation_date != null) {
        DateTime time = DateTime.fromMillisecondsSinceEpoch(
            reputation.creation_date! * 1000);

        DateTime dateOnly = DateTime(time.year, time.month, time.day);

        groupedByTime.putIfAbsent(dateOnly, () => []).add(reputation);
      }
    }

    return groupedByTime.entries.map((entry) {
      return ReputationGroupByTime(
        time: entry.key,
        reputationList: entry.value,
      );
    }).toList();
  }

  @override
  Future<void> getUserTopTags(int userId) async {
    _resetReputation();
    final tags = await _iUserService.getUserTopTags(
      userId: userId,
      page: 1,
      pageSize: 5,
      site: 'stackoverflow',
    );
    _tags = tags ?? [];

    notifyListeners();
  }
}
