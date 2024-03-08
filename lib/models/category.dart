import 'package:meta/meta.dart';

@immutable
class Category {
  final String categoryName;
  final String imageUrl;
  final int cookingTime;
  final String evaluate;

  const Category(
      {required this.categoryName,
      required this.imageUrl,
      required this.cookingTime,
      required this.evaluate});
}
