import '../../../models/login_model.dart';

abstract class BonianSignUpState {}

class BonianSignUpInitialState extends BonianSignUpState {}

class BonianSignUpLoadingState extends BonianSignUpState {}

class BonianSignUpSuccessState extends BonianSignUpState {
  final BonianLoginModel loginModel;

  BonianSignUpSuccessState(this.loginModel);
}

class BonianSignUpErrorState extends BonianSignUpState {
  final String error;

  BonianSignUpErrorState(this.error);
}

class BonianSignUpChangePasswordVisibilityState extends BonianSignUpState {}
