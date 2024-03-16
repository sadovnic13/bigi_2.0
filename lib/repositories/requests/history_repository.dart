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
      final Map<String, dynamic> bill = e['bill'] as Map<String, dynamic>;

      return HistoryRecord(
        id: e['id'],
        category: e['category_id'],
        billName: bill['name'],
        money: e['money'].toDouble(),
        date: e['date'],
        isProfit: e['isProfit'],
      );
    }).toList();

    return historyList;
  }

  Future<List<HistoryRecord>> getFilteredHistoryList(List<int> searchId) async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client
        .from('history')
        .select('*, bill:bill_id (name)')
        .filter('bill_id', 'in', searchId)
        .order('date', ascending: false)
        .order('created_at', ascending: false);

    final List<HistoryRecord> historyList = response.map((e) {
      // Получаем данные счета из связанной таблицы
      final bill = e['bill'] as Map<String, dynamic>;

      return HistoryRecord(
        id: e['id'],
        category: e['category_id'],
        billName: bill['name'],
        money: e['money'].toDouble(),
        date: e['date'],
        isProfit: e['isProfit'],
      );
    }).toList();

    return historyList;
  }

  Future<List<HistoryRecord>> getTodayHistory() async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client
        .from('history')
        .select('*, bill:bill_id (name)')
        .eq('date', DateTime.now().toString().substring(0, 10))
        .limit(4)
        .order('date', ascending: false)
        .order('created_at', ascending: false);

    final List<HistoryRecord> historyList = response.map((e) {
      // Получаем данные счета из связанной таблицы
      final bill = e['bill'] as Map<String, dynamic>;

      return HistoryRecord(
        id: e['id'],
        category: e['category_id'],
        billName: bill['name'],
        money: e['money'].toDouble(),
        date: e['date'],
        isProfit: e['isProfit'],
      );
    }).toList();

    return historyList;
  }

  Future<List<HistoryRecord>> getBillHistory(int id) async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client
        .from('history')
        .select('*, bill:bill_id (name)')
        .eq('bill_id', id)
        .eq('date', DateTime.now().toString().substring(0, 10))
        .limit(4)
        .order('date', ascending: false)
        .order('created_at', ascending: false);

    final List<HistoryRecord> historyList = response.map((e) {
      // Получаем данные счета из связанной таблицы
      final bill = e['bill'] as Map<String, dynamic>;

      return HistoryRecord(
        id: e['id'],
        category: e['category_id'],
        billName: bill['name'],
        money: e['money'].toDouble(),
        date: e['date'],
        isProfit: e['isProfit'],
      );
    }).toList();

    return historyList;
  }
}
