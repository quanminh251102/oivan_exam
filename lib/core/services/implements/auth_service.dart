
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:oivan_exam/constant.dart';
import 'package:oivan_exam/core/services/interfaces/iauth_service.dart';
import 'package:oivan_exam/core/utils/token_utils.dart';
import 'package:oivan_exam/global/global_data.dart';
import 'package:oivan_exam/global/locator.dart';

class AuthService implements IAuthService {
  @override
  Future<bool> checkLogin() async {
    var token = await TokenUtils.getToken();
    if (token != null) {
      locator<GlobalData>().token = token;
      return true;
    }
    return false;
  }

  String? getAccessToken(String url) {
    Uri uri = Uri.parse(url);
    String fragment = uri.fragment;
    List<String> params = fragment.split('&');
    String accessToken = params
        .firstWhere((param) => param.startsWith('access_token='))
        .split('=')[1];
    if (accessToken.isNotEmpty) {
      return accessToken;
    }
    return null;
  }

  @override
  Future<bool> initiateAuth() async {
    final authUrl = Uri.parse(authorizationEndpoint).replace(queryParameters: {
      'client_id': clientId,
      'scope': 'no_expiry',
      'redirect_uri': redirectUri,
    });

    final result = await FlutterWebAuth.authenticate(
      url: authUrl.toString(),
      callbackUrlScheme: 'callback-scheme',
    );

    if (getAccessToken(result) != null) {
      final String accessToken = getAccessToken(result)!;
      locator<GlobalData>().token = accessToken;
      await TokenUtils.saveToken(accessToken);
      return true;
    }
    return false;
  }
}
