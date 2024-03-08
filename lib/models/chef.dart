import 'package:meta/meta.dart';

@immutable
class Chef {
  final String name;
  final String avatar;
  final String description;
  final int recipe;
  final double rating;

  const Chef(
      {required this.name,
      required this.avatar,
      required this.description,
      required this.recipe,
      required this.rating});
}
