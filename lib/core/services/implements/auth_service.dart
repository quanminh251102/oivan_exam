import 'package:oivan_exam/core/services/interfaces/iauth_service.dart';

class AuthService implements IAuthService {
  // @override
  // Future<bool> login(String emailOrPhone, String password) async {
  //   LoadingDialogUtils.showLoading();
  //   try {
  //     var result = await getRestClient().getToken(LoginDto(
  //         userNameOrEmailAddress: emailOrPhone,
  //         password: password,
  //         deviceTypeId: 3));

  //     if (result.success) {
  //       TokenUtils.saveToken("Bearer ${result.result!.accessToken}");
  //     }
  //     return result.success;
  //   } on Exception catch (e) {
  //     print(e);
  //   } finally {
  //     LoadingDialogUtils.hideLoading();
  //   }
  //   return false;
  // }
}
