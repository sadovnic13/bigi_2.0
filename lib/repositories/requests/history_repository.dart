import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories.dart';

class HistoryRepository {
  Future<List<HistoryRecord>> getHistoryList() async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client
        .from('history')
        .select('*, bill:bill_id (name)')
        .order('date', ascending: false)
        .order('created_at', ascending: false);

    final List<HistoryRecord> historyList = response.map((e) {
      // Получаем данные счета из связанной таблицы
      final bill = e['bill'] as Map<String, dynamic>;

      return HistoryRecord(
        id: e['id'],
        category: e['category'],
        billName: bill['name'],
        money: e['money'].toDouble(),
        date: e['date'],
        isProfit: e['isProfit'],
      );
    }).toList();

    return historyList;
  }
}
