import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../design/design.dart';
import '../../../repositories/repositories.dart';
import '../bloc/regpage_bloc.dart';
import '../widgets/widgets.dart';

class RegPageScreen extends StatefulWidget {
  const RegPageScreen({super.key});

  @override
  State<RegPageScreen> createState() => _RegPageScreenState();
}

class _RegPageScreenState extends State<RegPageScreen> {
  final RegpageBloc regpageBloc = RegpageBloc(CategoryRepository());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocListener<RegpageBloc, RegpageState>(
        bloc: regpageBloc,
        listener: (context, state) {
          //success transition
          if (state is RegistrationSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home_page_screen',
              (route) => false,
            );
          }
          //error message
          if (state is RegistrationFailure) {
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
                  margin: const EdgeInsets.only(top: 25, bottom: 10),
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
                  child: user_add,
                ),
                InputForm(
                  regpageBloc: regpageBloc,
                ),

                // not a member? register now
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Уже есть аккаунт?',
                        style: TextStyle(color: secondTextColor),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/log_page_screen');
                        },
                        child: const Text(
                          'Авторизуйся',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
