import 'package:bigi/features/widgets_common/bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../design/design.dart';

class AdditionForm extends StatefulWidget {
  const AdditionForm({super.key});

  @override
  State<AdditionForm> createState() => _AdditionFormState();
}

class _AdditionFormState extends State<AdditionForm> {
  bool selectedChoice = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: successColor,
            blurRadius: 10.0,
          ),
        ],
        border: Border(
          // left: BorderSide(color: floatingColor, width: 1),
          top: BorderSide(color: floatingColor, width: 1),
          // right: BorderSide(color: floatingColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              ProfitChip(
                selectedChoice: selectedChoice,
                label: "Прибыль",
                onSelected: (selected) {
                  setState(() {
                    selectedChoice = true;
                  });
                },
              ),
              const SizedBox(
                width: 15,
              ),
              ProfitChip(
                selectedChoice: !selectedChoice,
                label: "Расход",
                onSelected: (selected) {
                  setState(() {
                    selectedChoice = false;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          TextFormField(
            cursorColor: successColor,
            style: theme.textTheme.titleLarge!.copyWith(color: successColor),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            ],
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              // fillColor: Colors.white,
              hintText: "0.00",
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Введите значение";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
