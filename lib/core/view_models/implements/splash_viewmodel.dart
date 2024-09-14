import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_exam/core/services/interfaces/iauth_service.dart';
import 'package:oivan_exam/core/view_models/interfaces/isplash_viewmodel.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:oivan_exam/global/router.dart';

class SplashViewModel with ChangeNotifier implements ISplashViewModel {
  final IAuthService _iAuthService = locator<IAuthService>();
  @override
  Future<void> checkLogin() async {
    if (await _iAuthService.checkLogin()) {
      Get.toNamed(MyRouter.home);
    } else {
      Get.toNamed(MyRouter.login);
    }
  }
}
