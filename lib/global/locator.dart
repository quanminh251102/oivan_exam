import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get_it/get_it.dart';

import 'package:oivan_exam/constant.dart';

import '../core/api/rest_client.dart';

import 'global_data.dart';
import 'locator_dao.dart';
import 'locator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());
  setupRestClient();
  registerDaoSingletons(locator);
  registerServiceSingletons(locator);
}

void setupRestClient() {
  var dio = Dio();
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (error, handler) async {
        if (error.error is SocketException) {
          EasyLoading.showError("Không có internet!");
          handler.reject(error);
        } else {
          if (error.response?.statusCode == 419) {
            // Get.dialog(
            //   const LogoutDialog(),
            //   barrierDismissible: false,
            // );
          } else {
            // Nếu lỗi trả về mã lỗi 401 403
            // if (error.response?.statusCode == 401 ||
            //     error.response?.statusCode == 403) {
            //Thực hiện xử lý lỗi tại đây
            // var errorDetails =
            //     ErrorDetailsDto.fromJson(error.response?.data["error"]);
            // EasyLoading.showError(errorDetails.message);
            EasyLoading.showError("Lỗi hệ thống");
            // print(errorDetails.message);
            // } else {
            // Get.snackbar("Lỗi máy chủ!", "", duration: Duration(microseconds: 700));
            //   EasyLoading.showError(errorDetails.message);
            // }
            // Chuyển tiếp lỗi cho các interceptor khác xử lý
            handler.next(error);
          }
        }
      },
    ),
  );

  dio.options = BaseOptions(
    connectTimeout: const Duration(seconds: 15),
  );

  try {
    locator.registerLazySingleton(
      () => RestClient(dio, baseUrl: baseUrl),
      instanceName: "RestClient",
    );
  } catch (e) {
    // Future.wait([LoggerUtils.logException(e)]);
  }
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}
