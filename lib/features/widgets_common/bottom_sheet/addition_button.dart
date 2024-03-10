import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../widgets_common.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(150)),
      ),
      backgroundColor: floatingColor,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return AdditionForm();
            });
      },
      child: SizedBox(
        height: 25,
        child: plus,
      ),
    );
  }
}
