// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:bonian/layout/cubit/states.dart';
import 'package:bonian/modules/donate/donate_screen.dart';
import 'package:bonian/modules/products/products_screen.dart';
import 'package:bonian/modules/settings_screen/settings_screen.dart';
import 'package:bonian/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonianCubit extends Cubit<BonianStates> {
  BonianCubit() : super(BonianInitialState());

  static BonianCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.production_quantity_limits),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sell_outlined),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
    ),
  ];

  List<Widget> screens = [
    ProductsScreen(),
    DonateScreen(),
    SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
  }

  List<dynamic> products = [];
  void getProducts() {
    emit(BonianGetProductsLoadingState());
    DioHelper.getData(url: '', query: {}).then((value) {
      products = value.data[''];
      print(products[0]['']);
      emit(BonianGetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BonianGetproductsErrorState(error.toString()));
    });
  }
}
