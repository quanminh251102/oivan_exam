import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';

abstract class IHomeViewModel implements ChangeNotifier {
  List<UserDto> get users;
  bool get hasMoreData;
  bool get isGetMore;
  List<int> get bookmarkedUserIds;
  bool get showOnlyBookmarked;
  void toggleFilter(bool value);
  void updateUser(int index, bool value);
  Future<void> initGetUsers();
  Future<void> getMoreUsers();
}
