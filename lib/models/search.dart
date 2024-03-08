import 'package:meta/meta.dart';

@immutable
class Search {
  final String name;
  final int dateSearch;
  final String image;

  const Search(
      {required this.name, required this.dateSearch, required this.image});
}
