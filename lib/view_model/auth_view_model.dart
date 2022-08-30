import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/routes/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool _signUpLoading = false;
  bool get loading => _loading;
  bool get signUpLoading => _signUpLoading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
     notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      Utils.flushErrorMessage('Login successful', context);
      setLoading(false);
      Navigator.pushNamed(context, RouteName.home);
    }).onError((error, stackTrace) {
      Utils.flushErrorMessage(error.toString(), context);
      setLoading(false);
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
     setSignUpLoading(true);
    _myRepo.registerApi(data).then((value) {
      Utils.flushErrorMessage('signup successful', context);
      setSignUpLoading(false);
      Navigator.pushNamed(context, RouteName.home);
    }).onError((error, stackTrace) {
      Utils.flushErrorMessage(error.toString(), context);
      setSignUpLoading(false);
    });
  }
}
