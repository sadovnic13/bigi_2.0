import 'package:equatable/equatable.dart';

class HistoryRecord extends Equatable {
  const HistoryRecord({
    required this.id,
    required this.category,
    required this.billName,
    required this.money,
    required this.date,
    required this.isProfit,
  });
  final int id;
  final String category;
  final String billName;
  final double money;
  final String date;
  final bool isProfit;

  @override
  List<Object?> get props => [id, category, billName, money, date, isProfit];
}
