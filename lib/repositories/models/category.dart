import 'package:flutter_svg/svg.dart';

class Category {
  Category({
    required this.id,
    required this.categotyIcon,
    required this.categoryName,
    required this.isProfit,
  });

  int id;
  SvgPicture categotyIcon;
  String categoryName;
  bool isProfit;
}
