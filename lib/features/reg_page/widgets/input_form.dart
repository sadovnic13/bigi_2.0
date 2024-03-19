import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../repositories/requests/requests.dart';
import '../../widgets_common/widgets_common.dart';
import 'widgets.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});
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
    final repeatPassword = _repeatPasswordController.text;
    final SupabaseClient client = Supabase.instance.client;
    final CategoryRepository categoryRepository = CategoryRepository();

    try {
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email))
        throw Exception("Неверный формат почты");
      if (!RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(password))
        throw Exception("Неверный формат пароля");
      if (password != repeatPassword) throw Exception("Пароли не совпадают");

      await client.auth.signUp(email: email, password: password);
      await categoryRepository.defaultCategoryCreation();

      print('Пользователь успешно зарегистрирован');
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home_page_screen',
        (route) => false,
      );
    } catch (e) {
      // String error = e;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      print('Ошибка при регистрации: $e');
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
            FloatingButton(
              label: "Зарегестрироваться",
              onTap: _registerUser,
            ),
          ],
        ),
      ],
    );
  }
}
