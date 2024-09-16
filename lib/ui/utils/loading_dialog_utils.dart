import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class LoadingDialogUtils {
  static SimpleFontelicoProgressDialog? _progressDialog;

  static void showLoading({
    String message = "Loading...",
  }) {
    if (_progressDialog != null) return;
    _progressDialog = SimpleFontelicoProgressDialog(
        context: Get.overlayContext!, barrierDimisable: false);
    _progressDialog!.show(
        message: message.tr,
        horizontal: false,
        width: 200,
        height: 200,
        separation: 30,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        hideText: true,
        backgroundColor: Colors.transparent,
        type: SimpleFontelicoProgressDialogType.custom,
        loadingIndicator: Lottie.asset(
          'assets/lottie/loading_text.json',
        ));
  }

  static void hideLoading() {
    try {
      _progressDialog!.hide();
      _progressDialog = null;
    } catch (e) {}
  }
}
