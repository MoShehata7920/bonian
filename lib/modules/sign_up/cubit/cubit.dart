import 'package:bonian/modules/sign_up/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/login_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class ShopSignUpCuibt extends Cubit<BonianSignUpState> {
  ShopSignUpCuibt() : super(BonianSignUpInitialState());
  static ShopSignUpCuibt get(context) => BlocProvider.of(context);
  // ShopLoginModel? loginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(BonianSignUpLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      var loginModel = BonianLoginModel.fromJson(value.data!);

      emit(
        BonianSignUpSuccessState(loginModel),
      );
    }).catchError((error) {
      emit(
        BonianSignUpErrorState(error.toString()),
      );
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(
      BonianSignUpChangePasswordVisibilityState(),
    );
  }
}
