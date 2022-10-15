import '../../../models/login_model.dart';

abstract class BonianLoginState {}

class BonianLoginInitialState extends BonianLoginState {}

class BonianLoginLoadingState extends BonianLoginState {}

class BonianLoginSuccessState extends BonianLoginState {
  final BonianLoginModel loginModel;

  BonianLoginSuccessState(this.loginModel);
}

class BonianLoginErrorState extends BonianLoginState {
  final String error;

  BonianLoginErrorState(this.error);
}

class BonianChangePasswordVisibilityState extends BonianLoginState {}
