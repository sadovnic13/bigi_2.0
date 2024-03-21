import 'package:bigi/features/log_page/bloc/logpage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../design/design.dart';
import '../../../repositories/requests/requests.dart';
import '../../features.dart';
import '../../widgets_common/widgets_common.dart';

class InputForm extends StatefulWidget {
  final LogpageBloc logpageBloc;
  const InputForm({super.key, required this.logpageBloc});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInUser() async {
    final email = _loginController.text;
    final password = _passwordController.text;
    final SupabaseClient client = Supabase.instance.client;
    final CategoryRepository categoryRepository = CategoryRepository();

    try {
      await client.auth.signInWithPassword(email: email, password: password);
      categoryList = await categoryRepository.getCategoryList();
      debugPrint(categoryList.toString());
      print('Пользователь успешно вошел в систему');
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home_page_screen',
        (route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      print('Ошибка при входе: $e');
    }
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
