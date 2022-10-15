import 'package:bonian/layout/cubit/cubit.dart';
import 'package:bonian/layout/cubit/states.dart';
import 'package:bonian/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonianLayoutScreen extends StatelessWidget {
  const BonianLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BonianCubit()..getProducts(),
      child: BlocConsumer<BonianCubit, BonianStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BonianCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'BONIAN APP',
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.brightness_6_outlined,
                  ),
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
