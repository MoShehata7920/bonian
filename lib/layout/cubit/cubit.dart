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
      icon: Icon(
        Icons.production_quantity_limits,
      ),
      label: "Products",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.add,
      ),
      label: "Donate",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: "Settings",
    ),
  ];

  List<Widget> screens = [
    ProductsScreen(),
    DonateScreen(),
    SettingsScreen(),
  ];

  changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BonianBottomNavState());
  }

  List<dynamic> products = [];

  void getProducts() {
    emit(BonianGetProductsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '13967fc2c7284db1a4895b8e0d307ee9'
      },
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      products = value.data['articles'];
      print(products[0]['title']);
      emit(BonianGetProductsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(BonianGetproductsErrorState(error.toString()));
    });
  }
}
