import 'package:bonian/modules/login/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../layout/bonian_layout_screen.dart';
import '../../shared/component/component.dart';
import '../../shared/network/local/cache_helper.dart';
import '../sign_up/sign_up_screen.dart';
import 'cubit/cubit.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BonianLoginCuibt(),
      child: BlocConsumer<BonianLoginCuibt, BonianLoginState>(
        listener: (context, state) {
          if (state is BonianLoginSuccessState) {
            if (state.loginModel.status!) {
              showToast(
                  text: state.loginModel.message.toString(),
                  state: ToastStates.SUCCESS);
              // ignore: avoid_print
              print(state.loginModel.message);
              // ignore: avoid_print
              print(state.loginModel.data!.token);

              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token!)
                  .then(
                (value) {
                  var token = state.loginModel.data!.token!;
                  // ignore: prefer_const_constructors
                  navigateAndFInish(context, BonianLayoutScreen());
                },
              );
            } else {
              // ignore: avoid_print
              print(state.loginModel.message!);
              showToast(
                  text: state.loginModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          // ignore: body_might_complete_normally_nullable
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          // ignore: body_might_complete_normally_nullable
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'Password is too short';
                            }
                          },
                          suffix: BonianLoginCuibt.get(context).suffix,
                          isPassword: BonianLoginCuibt.get(context).isPassword,
                          suffixPressed: () {
                            BonianLoginCuibt.get(context)
                                .changePasswordVisibility();
                          },
                          label: 'Password',
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! BonianLoginLoadingState,
                          builder: (context) => defaultButton(
                              background: Colors.blue,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  BonianLoginCuibt.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              text: 'LOGIN'),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Don\'t have an account'),
                            defaultTextButton(
                                function: () {
                                  navigateTo(
                                      context,
                                      // ignore: prefer_const_constructors
                                      RegisterScreen());
                                },
                                text: 'register'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
