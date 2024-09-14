import 'package:flutter/material.dart';

abstract class ISplashViewModel implements ChangeNotifier {
  Future<void> checkLogin();
}
