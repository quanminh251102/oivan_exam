import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/tag_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';

abstract class IUserService {
  int get totalUser;
  bool get hasMoreUser;
  int get totalReputationHistory;
  int get totalTopTags;
  Future<List<UserDto>?> getUsers(
    bool isShowLoading, {
    int? page,
    int? pageSize,
    String? site,
  });

  Future<List<ReputationHistoryDto>?> getUserReputation({
    int? userId,
    int? page,
    int? pageSize,
    String? site,
  });

  Future<List<TagDto>?> getUserTopTags({
    int? userId,
    int? page,
    int? pageSize,
    String? site,
  });
}
