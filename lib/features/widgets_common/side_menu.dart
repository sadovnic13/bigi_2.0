import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../design/design.dart';
import '../../theme/theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: surfaceColor,
      elevation: 0,
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
                  'Нагорный Герман',
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                DrawerItem(
                  name: 'Главная',
                  icon: house_2,
                  onPressed: () {
                    doRoute(context, '/');
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
        ],
      ),
    );
  }

  void doRoute(BuildContext context, String name) async {
    if (ModalRoute.of(context)?.settings.name != name) {
      // if (currentRoute != name) {
      // await getSmallHistory();
      Navigator.pushReplacementNamed(
        context,
        name,
        // (Route<dynamic> route) => false,
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
