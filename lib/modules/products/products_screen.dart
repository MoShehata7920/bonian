import 'package:bonian/layout/cubit/cubit.dart';
import 'package:bonian/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, State) {},
      builder: (context, state) {
        var list = BonianCubit.get(context).products;
        return itemsBuilder(list, context);
      },
    );
  }
}
