import 'package:project/data/models/account.dart';

class LoginResponse {
  final Account account;
  final String token;

  LoginResponse({required this.account, required this.token});
}
