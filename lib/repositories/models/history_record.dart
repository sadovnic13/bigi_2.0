class HistoryRecord {
  const HistoryRecord(
      {required this.id,
      required this.category,
      required this.billId,
      required this.money,
      required this.date,
      required this.isProfit});

  final int id;
  final String category;
  final int billId;
  final double money;
  final String date;
  final bool isProfit;
}
