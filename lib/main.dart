// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:bonian/layout/bonian_layout_screen.dart';
import 'package:bonian/layout/cubit/cubit.dart';
import 'package:bonian/shared/cubit/cubit.dart';
import 'package:bonian/shared/cubit/states.dart';
import 'package:bonian/shared/network/local/cache_helper.dart';
import 'package:bonian/shared/styles/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  // ignore: unused_local_variable
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp((isDark!)));
}

//Stateless
//Stateful

//class MyPP

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  //constructor
  //build

  final bool isDark ;
  // ignore: prefer_const_constructors_in_immutables
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => BonianCubit()
          ..getProducts()
          ) ,
          BlocProvider(create: (BuildContext context) => AppCubit()
          ..changeAppMode(
            fromShared: isDark,
          ),
          )
          // BlocProvider(create: (context) =>  )
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.amber ,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0 ,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20 ,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  ) ,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.amber,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.grey,
                  elevation: 25 ,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodySmall: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

              ),
              darkTheme: ThemeData (
                primarySwatch: Colors.amber,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                  titleSpacing: 20,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarBrightness: Brightness.light,
                  ),
                  backgroundColor: Colors.black,
                  elevation: 0.0 ,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20 ,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.amber
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.amber,
                  unselectedItemColor: Colors.white,
                  elevation: 25 ,
                  backgroundColor: Colors.black,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18 ,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ) ,
              themeMode:AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
            );
          },
        ));
  }
}
