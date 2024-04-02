import 'package:flutter_svg/svg.dart';

class Category {
  Category({
    required this.id,
    required this.categotyIcon,
    required this.categoryName,
    required this.isProfit,
  });

  final int id;
  final SvgPicture categotyIcon;
  final String categoryName;
  final bool isProfit;
}
