import 'package:flutter/material.dart';

import '../../../design/design.dart';

class AdditionForm extends StatefulWidget {
  const AdditionForm({super.key});

  @override
  State<AdditionForm> createState() => _AdditionFormState();
}

class _AdditionFormState extends State<AdditionForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: successColor,
    );
  }
}
