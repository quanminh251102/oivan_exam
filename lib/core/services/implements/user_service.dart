import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/core/services/interfaces/iuser_service.dart';
import 'package:oivan_exam/global/global_data.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:oivan_exam/ui/utils/loading_dialog_utils.dart';

class UserService implements IUserService {
  int _totalUser = 0;
  bool _hasMoreUser = false;
  @override
  int get totalUser => _totalUser;
  @override
  bool get hasMoreUser => _hasMoreUser;

  int _totalReputationHistory = 0;
  @override
  int get totalReputationHistory => _totalReputationHistory;

  int _totalTopTags = 0;
  @override
  int get totalTopTags => _totalTopTags;

  @override
  Future<List<UserDto>?> getUsers(
    bool isShowLoading, {
    int? page,
    int? pageSize,
    String? site,
  }) async {
    if (isShowLoading) LoadingDialogUtils.showLoading();
    try {
      var result = await getRestClient().getUsers(
        page: page,
        pageSize: pageSize,
        site: site,
      );
      if (isShowLoading) LoadingDialogUtils.hideLoading();
      if (result.items != null) {
        if (result.items!.isNotEmpty) {
          _totalUser = result.items!.length;
          _hasMoreUser = result.has_more ?? false;
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

  @override
  Future<List<TagDto>?> getUserTopTags({
    int? userId,
    int? page,
    int? pageSize,
    String? site,
  }) async {
    LoadingDialogUtils.showLoading();
    try {
      var result = await getRestClient().getUserTopTags(
        userId: userId,
        page: pageSize,
        pageSize: pageSize,
        site: site,
      );
      LoadingDialogUtils.hideLoading();
      if (result.items != null) {
        if (result.items!.isNotEmpty) {
          _totalTopTags = result.items!.length;
          return result.items;
        }
      }
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }
}
