import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories.dart';

class HistoryRepositories {
  Future<List<HistoryRecord>> getHistoryList() async {
    final SupabaseClient client = Supabase.instance.client;
    final response =
        await client.from('history').select('*').order('date', ascending: false).order('created_at', ascending: false);

    final List<HistoryRecord> historyList = response
        .map((e) => HistoryRecord(
              id: e['id'],
              category: e['category'],
              billId: e['bill_id'],
              money: e['money'].toDouble(),
              date: e['date'],
              isProfit: e['isProfit'],
            ))
        .toList();

    return historyList;
  }
}
