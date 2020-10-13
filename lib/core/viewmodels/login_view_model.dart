import 'package:flutter/cupertino.dart';
import 'package:provider_archi/core/services/authentication_service.dart';
import 'package:provider_archi/core/viewmodels/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationService _authenticationService;

  LoginViewModel({
    @required AuthenticationService authenticationService,
  }) : _authenticationService = authenticationService;


  Future<bool> login(String userIdText) async {
    setBusy(true);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setBusy(false);
    return success;
  }
}
