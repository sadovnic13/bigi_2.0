import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../bloc/logpage_bloc.dart';
import '../widgets/widgets.dart';

class LogPageScreen extends StatefulWidget {
  const LogPageScreen({super.key});

  @override
  State<LogPageScreen> createState() => _LogPageScreenState();
}

class _LogPageScreenState extends State<LogPageScreen> {
  final LogpageBloc logpageBloc = LogpageBloc(CategoryRepository());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocListener<LogpageBloc, LogpageState>(
        bloc: logpageBloc,
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home_page_screen',
              (route) => false,
            );
          }
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(
                content: Text("Ошибка!"),
                duration: Duration(seconds: 3),
              ));
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  margin: const EdgeInsets.only(top: 50, bottom: 10),
                  padding: const EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(75),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: successColor,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: user,
                ),
                InputForm(
                  logpageBloc: logpageBloc,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Еще нет аккаунта?',
                        style: TextStyle(color: secondTextColor),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/reg_page_screen');
                        },
                        child: const Text(
                          'Регистрируйся',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
