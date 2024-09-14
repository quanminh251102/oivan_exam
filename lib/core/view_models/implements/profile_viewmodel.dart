import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/iprofile_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:collection/collection.dart';

class ProfileViewModel with ChangeNotifier implements IProfileViewModel {
  final IUserService _iUserService = locator<IUserService>();

  List<ReputationHistoryDto> _reputations = [];

  List<ReputationGroupByPost> _reputationGroupByPost = [];
  @override
  List<ReputationGroupByPost> get reputationGroupByPost =>
      _reputationGroupByPost;

  int _totalReputations = 0;
  int _totalReputationGroupByPost = 0;
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
      pageSize: 30,
      site: 'stackoverflow',
    );
    _reputations = reputationList ?? [];

    Map<int, dynamic> reputations = _reputations.groupListsBy(
      (element) {
        _totalReputations += element.reputationChange!;
        return element.postId!;
      },
    );

    reputations.forEach((postId, reputations) {
      _reputationGroupByPost.add(
        ReputationGroupByPost(postId: postId, reputationList: reputations),
      );
    });

    notifyListeners();
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
