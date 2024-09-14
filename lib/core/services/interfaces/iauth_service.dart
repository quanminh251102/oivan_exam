abstract class IAuthService {
  Future<bool> checkLogin();
  Future<bool> initiateAuth();
}
