import 'package:tool/data/models/account.dart';
import 'package:tool/data/repositories/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account> getMyProfile();
  Future<bool> deleteAccount(String userId);
}
