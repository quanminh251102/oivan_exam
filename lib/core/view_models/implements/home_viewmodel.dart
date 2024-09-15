import 'package:flutter/material.dart';
import 'package:oivan_exam/core/database/db_helper.dart';
import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';

import '../../dto/user/user_dto.dart';

class HomeViewModel with ChangeNotifier implements IHomeViewModel {
  final IUserService _iUserService = locator<IUserService>();
  bool _showOnlyBookmarked = false;
  @override
  bool get showOnlyBookmarked => _showOnlyBookmarked;

  final DatabaseHelper dbHelper = DatabaseHelper();
  List<int> _bookmarkedUserIds = [];
  @override
  List<int> get bookmarkedUserIds => _bookmarkedUserIds;

  List<UserDto> _users = [];
  List<UserDto> _filteredUsers = [];
  int _totalUser = 0;
  bool _hasMoreData = false;
  bool _isGetMore = false;

  int page = 2;

  @override
  List<UserDto> get users => _showOnlyBookmarked ? _filteredUsers : _users;
  @override
  bool get hasMoreData => _hasMoreData;
  @override
  bool get isGetMore => _isGetMore;

  void _reset() {
    page = 1;
    _showOnlyBookmarked = false;
    _bookmarkedUserIds.clear();
    _users.clear();
    _filteredUsers.clear();
  }

  @override
  void toggleFilter(bool value) {
    _showOnlyBookmarked = value;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (_showOnlyBookmarked) {
      _filteredUsers =
          _users.where((user) => user.isBookmarked ?? false).toList();
    } else {
      _filteredUsers = _users;
    }
    notifyListeners();
  }

  @override
  void updateUser(int id, bool value) {
    int index = _users.indexWhere((user) => user.user_id == id);
    if (value) {
      _users.elementAt(index).isBookmarked = true;
    } else {
      _users.elementAt(index).isBookmarked = false;
    }
    notifyListeners();
  }

  @override
  Future<void> initGetUsers() async {
    _reset();
    final userList = await _iUserService.getUsers(
      true,
      page: 1,
      pageSize: 10,
      site: 'stackoverflow',
    );
    _users = userList ?? [];
    _bookmarkedUserIds = await dbHelper.getBookmarkedUsers();
    for (var user in users) {
      user.isBookmarked = _bookmarkedUserIds.contains(user.user_id);
    }
    _totalUser = _iUserService.totalUser;
    _hasMoreData = _iUserService.hasMoreUser;
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
      false,
      page: page,
      pageSize: page * 10,
      site: 'stackoverflow',
    );
    if (userList!.isNotEmpty) {
      for (var element in userList) {
        element.isBookmarked = _bookmarkedUserIds.contains(element.user_id);
        _users.add(element);
      }
    }
    _totalUser = _iUserService.totalUser;
    _isGetMore = false;
    notifyListeners();
  }
}
