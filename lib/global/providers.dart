import 'package:oivan_exam/core/view_models/implements/home_viewmodel.dart';
import 'package:oivan_exam/core/view_models/interfaces/ihome_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> viewModelProviders = [
  ChangeNotifierProvider<IHomeViewModel>(
    create: (_) => HomeViewModel(),
  ),
];
