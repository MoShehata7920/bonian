// ignore_for_file: prefer_const_constructors

import 'package:bonian/layout/bonian_layout_screen.dart';
import 'package:bonian/shared/cubit/cubit.dart';
import 'package:bonian/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/login/login_screen.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  Widget widget;

  // ignore: unused_local_variable
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');
  // ignore: avoid_print
  print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = BonianLayoutScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key, this.isDark}) : super(key: key);

  final bool? isDark;
  final Widget? startWidget;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  MyApp({this.isDark, this.startWidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            )),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            // AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
