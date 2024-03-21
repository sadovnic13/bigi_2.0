import 'package:bigi/features/reg_page/bloc/regpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../design/design.dart';
import '../../../repositories/requests/requests.dart';
import '../../widgets_common/widgets_common.dart';
import 'widgets.dart';

class InputForm extends StatefulWidget {
  final RegpageBloc regpageBloc;
  const InputForm({super.key, required this.regpageBloc});
  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final email = _loginController.text;
    final password = _passwordController.text;
    final repeatedPassword = _repeatPasswordController.text;
    final SupabaseClient client = Supabase.instance.client;
    final CategoryRepository categoryRepository = CategoryRepository();
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

                  // password textfield
                  DataTextField(
                    controller: _repeatPasswordController,
                    hintText: 'Пароль поторно',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),

            // sign in button
            BlocBuilder<RegpageBloc, RegpageState>(
              bloc: widget.regpageBloc,
              builder: (context, state) {
                if (state is RegistrationLoading) {
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
                    'Зарегистрироваться',
                    style: TextStyle(
                      color: backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize20,
                    ),
                  ),
                  onTap: () {
                    widget.regpageBloc.add(SignUpUser(
                      email: _loginController.text,
                      password: _passwordController.text,
                      repeatedPassword: _repeatPasswordController.text,
                    ));
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
