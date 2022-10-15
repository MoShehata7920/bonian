import 'package:flutter/material.dart';
import '../../shared/component/component.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email must not be empty';
                      }
                      return null;
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                    onFieldSubmitted: (String value) {
                      // ignore: avoid_print
                      print(value);
                    },
                    onChanged: (String value) {
                      // ignore: avoid_print
                      print(value);
                    }),
                const SizedBox(
                  height: 30,
                ),
                defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Password must not be empty';
                      }
                      return null;
                    },
                    label: 'PASSWORD',
                    prefix: Icons.lock,
                    suffix: isPasswordShow
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isPassword: isPasswordShow,
                    suffixPressed: () {
                      setState(() {
                        isPasswordShow = !isPasswordShow;
                      });
                    },
                    onFieldSubmitted: (String value) {
                      // ignore: avoid_print
                      print(value);
                    },
                    onChanged: (String value) {
                      // ignore: avoid_print
                      print(value);
                    }),
                const SizedBox(
                  height: 30,
                ),
                defaultButton(
                  text: 'Login',
                  background: Colors.blue,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      // ignore: avoid_print
                      print(emailController.text);
                      // ignore: avoid_print
                      print(passwordController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account?',
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up Now',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
