import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../repositories.dart';

class CategoryRepository {
  Future<List<Category>> getCategoryList() async {
    final SupabaseClient client = Supabase.instance.client;
    final response = await client.from('categories').select('*').eq('user_id', client.auth.currentUser!.id);

    final List<Category> categoryList = response
        .map((e) => Category(
              id: e['id'],
              categoryName: e['category_name'],
              categotyIcon: SvgPicture.asset(
                'assets/images/' + e['icon_name'],
                colorFilter: ColorFilter.mode(Color(int.parse(e['color'])), BlendMode.srcIn),
              ),
              isProfit: e['isProfit'],
            ))
        .toList();

    return categoryList;
  }

  Future<void> defaultCategoryCreation() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;

    if (userId != null) {
      //Список дефолтных категорий
      final defaultCategories = [
        {
          'user_id': userId,
          'icon_name': 'house_2.svg',
          'color': '0xFF9EFF4E',
          'category_name': 'Дом',
          'isProfit': false
        },
        {
          'user_id': userId,
          'icon_name': 'moneys.svg',
          'color': '0xFF9EFF4E',
          'category_name': 'Зарплата',
          'isProfit': true
        },
      ];

      for (var category in defaultCategories) {
        await Supabase.instance.client.from('categories').insert(category);
      }
    }
  }
}
