import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/routes/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';

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
      UserViewModel().saveUser(UserModel(token: value["token"]));
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
      setSignUpLoading(false);
      Navigator.pushNamed(context, RouteName.home);
    }).onError((error, stackTrace) {
      Utils.flushErrorMessage(error.toString(), context);
      setSignUpLoading(false);
    });
  }
}
