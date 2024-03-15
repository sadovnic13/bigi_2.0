import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../design/design.dart';
import '../../theme/theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // final client = Supabase.instance.client;
    // final name = client.from('profiles').select('*').eq('id', client.auth.currentUser!.id).single().toString();
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: surfaceColor,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
          border: Border(
            right: BorderSide(color: floatingColor, width: 1),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: profile_circle,
                  ),
                  Text(
                    Supabase.instance.client.auth.currentUser!.email!,
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    DrawerItem(
                      name: 'Главная',
                      icon: house_2,
                      onPressed: () {
                        doRoute(context, '/home_page_screen');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DrawerItem(
                      name: 'История',
                      icon: archive,
                      onPressed: () {
                        doRoute(context, '/history_page_screen');
                      },
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Supabase.instance.client.auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/log_page_screen',
                  (route) => false,
                );
              },
              style: ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              child: Text(
                'Выход',
                style: theme.textTheme.titleSmall,
              ),
            )
          ],
        ),
      ),
    );
  }

  void doRoute(BuildContext context, String name) async {
    if (ModalRoute.of(context)?.settings.name != name) {
      // if (currentRoute != name) {
      // await getSmallHistory();
      Navigator.pushNamedAndRemoveUntil(
        context,
        name,
        // '/history_page_screen',
        (Route<dynamic> route) => false,
        arguments: <int>[],
      );
    } else {
      Navigator.pop(context);
    }

    // currentRoute = name;
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
  });

  final String name;
  final SvgPicture icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 25,
              width: litleiconsize,
              child: icon,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                  fontFamily: fontFamilyMontserrat,
                  fontSize: fontSize20,
                  fontWeight: FontWeight.w400,
                  color: mainTextColor),
            )
          ],
        ),
      ),
    );
  }
}
