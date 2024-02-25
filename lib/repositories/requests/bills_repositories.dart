import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';

class BillsRepositories {
  Future<List<MoneyBill>> getBillsList() async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client.from('bills').select('*').order('created_at', ascending: true);

    final List<MoneyBill> billsList = response
        .map((e) => MoneyBill(
              id: e['id'],
              name: e['name'],
              balance: e['balance'].toDouble(),
            ))
        .toList();

    return billsList;
  }
}
