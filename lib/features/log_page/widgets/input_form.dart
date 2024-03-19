import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../../repositories/requests/requests.dart';
import '../../features.dart';
import '../../widgets_common/widgets_common.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});
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
            FloatingButton(
              label: "Войти",
              onTap: _signInUser,
            ),
          ],
        ),

        // not a member? register now
      ],
    );
  }
}
