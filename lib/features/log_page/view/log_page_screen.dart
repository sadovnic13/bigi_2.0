import 'package:bigi/features/features.dart';
import 'package:bigi/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogPageScreen extends StatefulWidget {
  const LogPageScreen({super.key});

  @override
  State<LogPageScreen> createState() => _LogPageScreenState();
}

class _LogPageScreenState extends State<LogPageScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final email = _loginController.text;
    final password = _passwordController.text;
    final SupabaseClient client = Supabase.instance.client;
    final CategoryRepository categoryRepository = CategoryRepository();

    try {
      await client.auth.signUp(email: email, password: password);
      await categoryRepository.defaultCategoryCreation();

      print('Пользователь успешно зарегистрирован');
    } catch (e) {
      print('Ошибка при регистрации: $e');
    }
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
      print('Ошибка при входе: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Логин",
              style: theme.textTheme.titleLarge,
            ),
            TextFormField(
              controller: _loginController,
              style: theme.textTheme.titleMedium,
              decoration: InputDecoration(
                labelText: 'Введите логин',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите логин';
                }
                return null;
              },
            ),
            Text(
              "Пароль",
              style: theme.textTheme.titleLarge,
            ),
            TextFormField(
              controller: _passwordController,
              style: theme.textTheme.titleMedium,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Введите пароль',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите пароль';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text("Зарегистрироваться"),
            ),
            ElevatedButton(
              onPressed: _signInUser,
              child: Text("Войти"),
            ),
          ],
        ),
      ),
    );
  }
}
