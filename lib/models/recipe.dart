// ignore_for_file: must_be_immutable

import 'package:meta/meta.dart';
@immutable
class Recipe {
  final String recipeName;
  final String imageUrl;
  final int cookingTime;
  final String evaluate;
  late bool favorite;

  Recipe(
      {required this.recipeName,
      required this.imageUrl,
      required this.cookingTime,
      required this.evaluate,
      required this.favorite});
}
