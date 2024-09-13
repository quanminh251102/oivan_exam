import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:oivan_exam/ui/utils/loading_dialog_utils.dart';

class UserService implements IUserService {
  int _totalUser = 0;
  @override
  int get totalUser => _totalUser;

  int _totalReputationHistory = 0;
  @override
  int get totalReputationHistory => _totalReputationHistory;

  @override
  Future<List<UserDto>?> getUsers({
    int? page,
    int? pageSize,
    String? site,
  }) async {
    LoadingDialogUtils.showLoading();
    try {
      var result = await getRestClient().getUsers(
        page: pageSize,
        pageSize: pageSize,
        site: site,
      );
      LoadingDialogUtils.hideLoading();
      if (result.items != null) {
        if (result.items!.isNotEmpty) {
          return result.items;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<List<ReputationHistoryDto>?> getUserReputation({
    int? userId,
    int? page,
    int? pageSize,
    String? site,
  }) async {
    LoadingDialogUtils.showLoading();
    try {
      var result = await getRestClient().getUserReputation(
        userId: userId,
        page: pageSize,
        pageSize: pageSize,
        site: site,
      );
      LoadingDialogUtils.hideLoading();
      if (result.items != null) {
        if (result.items!.isNotEmpty) {
          _totalReputationHistory = result.items!.length;
          return result.items;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
