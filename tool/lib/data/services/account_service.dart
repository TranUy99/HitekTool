import 'package:tool/data/models/account.dart';
import 'package:tool/data/services/local_service.dart';
import 'package:get/get.dart';

class AccountService extends GetxService {
  LocalService localService;
  AccountService({
    required this.localService,
  });

  var me = Rx<Account?>(null);
  Account? get myAccount => me.value;

  setAccount(Account? account) {
    me.value = account;
  }

  // cacheAccessToken(String accessToken) {
  //   localService.cacheToken(accessToken);
  // }

  // cacheId(String id) {
  //   localService.cacheId(id);
  // }

  // logout() {
  //   localService.clear();
  // }
}
