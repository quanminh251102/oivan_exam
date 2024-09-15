import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoadingDialogUtils {
  static SimpleFontelicoProgressDialog? _progressDialog;

  /// show loading and return the dialog
  static void showLoading({
    String message = "Loading...",
  }) {
    if (_progressDialog != null) return;
    _progressDialog = SimpleFontelicoProgressDialog(
        context: Get.overlayContext!, barrierDimisable: false);
    _progressDialog!.show(
        message: message.tr,
        horizontal: false,
        width: 100,
        height: 120,
        separation: 30,
        textStyle:const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        hideText: true,
        backgroundColor: Colors.transparent,
        type: SimpleFontelicoProgressDialogType.custom,
        loadingIndicator: Lottie.asset(
          'assets/lottie/loading.json',
        ));
  }

  static void hideLoading() {
    try {
      _progressDialog!.hide();
      _progressDialog = null;
    } catch (e) {}
  }
}
