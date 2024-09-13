import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';

abstract class IHomeViewModel implements ChangeNotifier {
  List<UserDto> get users;
  Future<void> initGetUsers();
}
