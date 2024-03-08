import 'package:meta/meta.dart';

@immutable
class LiveCooking {
  final String name;
  final String avatar;
  final int recipe;
  final String url;

  const LiveCooking(
      {required this.name,
      required this.avatar,
      required this.recipe,
      required this.url});
}
