import 'package:bonian/modules/login/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/login_model.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class BonianLoginCuibt extends Cubit<BonianLoginState> {
  BonianLoginCuibt() : super(BonianLoginInitialState());
  static BonianLoginCuibt get(context) => BlocProvider.of(context);
  BonianLoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(BonianLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        "email": email,
        "password": password,
      },
    ).then((value) {
      // ignore: avoid_print
      print(value.data);
      loginModel = BonianLoginModel.fromJson(value.data!);

      emit(
        BonianLoginSuccessState(loginModel!),
      );
    }).catchError((error) {
      emit(
        BonianLoginErrorState(error.toString()),
      );
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off;

    emit(
      BonianChangePasswordVisibilityState(),
    );
  }
}
