import 'package:oivan_exam/core/view_models/implements/auth_viewmodel.dart';
import 'package:oivan_exam/core/view_models/implements/home_viewmodel.dart';
import 'package:oivan_exam/core/view_models/implements/profile_viewmodel.dart';
import 'package:oivan_exam/core/view_models/implements/splash_viewmodel.dart';
import 'package:oivan_exam/core/view_models/interfaces/iauth_viewmodel.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:oivan_exam/core/view_models/interfaces/iprofile_viewmodel.dart';
import 'package:oivan_exam/core/view_models/interfaces/isplash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IHomeViewModel>(
    create: (_) => HomeViewModel(),
  ),
  ChangeNotifierProvider<IProfileViewModel>(
    create: (_) => ProfileViewModel(),
  ),
  ChangeNotifierProvider<ISplashViewModel>(
    create: (_) => SplashViewModel(),
  ),
  ChangeNotifierProvider<IAuthViewModel>(
    create: (_) => AuthViewModel(),
  ),
];
