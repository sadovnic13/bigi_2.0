import 'package:flutter/material.dart';

import '../../../repositories/repositories.dart';
import '../bloc/bloc.dart';

class BillChip extends StatefulWidget {
  final List<int> selectedItems;
  final MoneyBill item;
  final FilterBloc filterBloc;
  const BillChip({
    super.key,
    required this.selectedItems,
    required this.item,
    required this.filterBloc,
  });

  @override
  State<BillChip> createState() => _BillChipState();
}

class _BillChipState extends State<BillChip> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      labelPadding: const EdgeInsets.symmetric(horizontal: 10),
      labelStyle: TextStyle(
        fontSize: 13,
        color: widget.selectedItems.contains(widget.item.id) ? const Color(0xFF000000) : const Color(0xFFE5FF70),
      ),
      backgroundColor: const Color(0xFF000000),
      selectedColor: const Color(0xFFE5FF70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: widget.selectedItems.contains(widget.item.id) ? Colors.transparent : const Color(0xFFE5FF70),
        ),
      ),
      showCheckmark: false,
      label: Text(widget.item.name),
      selected: widget.selectedItems.contains(widget.item.id),
      onSelected: (selected) {
        setState(() {
          selected ? widget.selectedItems.add(widget.item.id) : widget.selectedItems.remove(widget.item.id);
        });

        widget.filterBloc.add(LoadHistoryList(selectedItems: widget.selectedItems));
      },
    );
  }
}