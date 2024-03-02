import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/models.dart';

class BillsRepository {
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

  Future<MoneyBill> getBill(int id) async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client.from('bills').select('*').eq('id', id).single();

    final MoneyBill bill = MoneyBill(
      id: response['id'],
      name: response['name'],
      balance: response['balance'].toDouble(),
    );

    return bill;
  }
}
