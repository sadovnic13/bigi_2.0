// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../design/design.dart';

class ProfitChip extends StatefulWidget {
  final bool selectedChoice;
  final Function(bool) onSelected;
  final String label;
  const ProfitChip({
    Key? key,
    required this.selectedChoice,
    required this.label,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<ProfitChip> createState() => _ProfitChipState();
}

class _ProfitChipState extends State<ProfitChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      labelStyle: TextStyle(
        fontSize: 13,
        color: widget.selectedChoice ? backgroundColor : floatingColor,
      ),
      backgroundColor: backgroundColor,
      selectedColor: floatingColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: widget.selectedChoice ? Colors.transparent : floatingColor,
        ),
      ),
      showCheckmark: false,
      label: Text(widget.label),
      selected: widget.selectedChoice,
      onSelected: widget.onSelected,
    );
  }
}
