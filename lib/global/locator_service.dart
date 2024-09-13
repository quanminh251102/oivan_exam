import 'package:get_it/get_it.dart';
import 'package:oivan_exam/core/services/implements/auth_service.dart';
import 'package:oivan_exam/core/services/implements/user_service.dart';
import 'package:oivan_exam/core/services/interfaces/iauth_service.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';

void registerServiceSingletons(GetIt locator) {
  locator.registerLazySingleton<IAuthService>(() => AuthService());
  locator.registerLazySingleton<IUserService>(() => UserService());
}
