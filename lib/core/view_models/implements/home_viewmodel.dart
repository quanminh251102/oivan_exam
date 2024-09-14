import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';

import '../../dto/user/user_dto.dart';

class HomeViewModel with ChangeNotifier implements IHomeViewModel {
  final IUserService _iUserService = locator<IUserService>();

  List<UserDto> _users = [];
  int _totalUser = 0;
  bool _hasMoreData = false;
  bool _isGetMore = false;

  List<ReputationHistoryDto> _reputations = [];
  int _totalReputations = 0;

  int page = 2;

  @override
  List<UserDto> get users => _users;
  @override
  bool get hasMoreData => _hasMoreData;
  @override
  bool get isGetMore => _isGetMore;

  void _reset() {
    page = 1;
    _users.clear();
  }

  void _resetReputation() {
    page = 1;
    _reputations.clear();
  }

  @override
  Future<void> initGetUsers() async {
    _reset();
    final userList = await _iUserService.getUsers(
      page: 1,
      pageSize: 10,
      site: 'stackoverflow',
    );
    _users = userList ?? [];
    _totalUser = _iUserService.totalUser;
    _hasMoreData = _iUserService.hasMore;
    notifyListeners();
  }

  @override
  Future<void> getMoreUsers() async {
    if (_totalUser == 0) {
      return;
    }
    _isGetMore = true;
    notifyListeners();
    page += 1;
    final userList = await _iUserService.getUsers(
      page: page,
      pageSize: page * 10,
      site: 'stackoverflow',
    );

    _users.addAll(
      userList ?? [],
    );
    _totalUser = _iUserService.totalUser;
    _isGetMore = false;
    notifyListeners();
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
    _totalReputations = _iUserService.totalReputationHistory;
    notifyListeners();
  }
}
