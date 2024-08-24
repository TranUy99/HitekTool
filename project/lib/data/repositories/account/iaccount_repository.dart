import 'package:project/data/models/account.dart';
import 'package:project/data/repositories/ibase_repository.dart';

abstract class IAccountRepository extends IBaseRepository {
  Future<Account> getMyProfile();
  Future<bool> deleteAccount(String userId);
}
