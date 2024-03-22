import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../features.dart';
import '../../widgets_common/widgets_common.dart';
import '../bloc/logpage_bloc.dart';

class InputForm extends StatefulWidget {
  final LogpageBloc logpageBloc;
  const InputForm({super.key, required this.logpageBloc});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // username textfield
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  DataTextField(
                    controller: _loginController,
                    hintText: 'Почта',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  // password textfield
                  DataTextField(
                    controller: _passwordController,
                    hintText: 'Пароль',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Забыли пароль?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),

            // sign in button

            BlocBuilder<LogpageBloc, LogpageState>(
              bloc: widget.logpageBloc,
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const FloatingButton(
                    label: SizedBox(
                      height: 30,
                      width: 30,
                      child: LoadCircular(
                        color: backgroundColor,
                      ),
                    ),
                    onTap: null,
                  );
                }

                return FloatingButton(
                  label: const Text(
                    'Войти',
                    style: TextStyle(
                      color: backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize20,
                    ),
                  ),
                  onTap: () {
                    widget.logpageBloc
                        .add(SignInUser(email: _loginController.text, password: _passwordController.text));
                  },
                );
              },
            ),
          ],
        ),

        // not a member? register now
      ],
    );
  }
}
