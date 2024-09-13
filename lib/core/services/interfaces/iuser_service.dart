import 'package:oivan_exam/core/dto/user/reputation_history_dto.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';

abstract class IUserService {
  int get totalUser;
  int get totalReputationHistory;

  Future<List<UserDto>?> getUsers({
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
}
