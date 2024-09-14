import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_exam/core/services/interfaces/iauth_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/iauth_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:oivan_exam/global/router.dart';

class AuthViewModel with ChangeNotifier implements IAuthViewModel {
  final IAuthService _iAuthService = locator<IAuthService>();
  @override
  Future<void> getAuthentication() async {
    if (await _iAuthService.initiateAuth()) {
      Get.toNamed(MyRouter.home);
    }
  }
}
