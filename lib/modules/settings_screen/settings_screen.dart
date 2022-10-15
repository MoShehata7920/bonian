import 'package:bonian/layout/cubit/cubit.dart';
import 'package:bonian/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Settings'));
    // BlocConsumer(
    //   listener: (context, State) {},
    //   builder: (context, state) {
    //     var list = BonianCubit.get(context).products;
    //     return itemsBuilder(list, context);
    //   },
    // );
  }
}
