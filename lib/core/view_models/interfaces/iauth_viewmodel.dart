import 'package:flutter/material.dart';

abstract class IAuthViewModel implements ChangeNotifier {
  Future<void> getAuthentication();
}
