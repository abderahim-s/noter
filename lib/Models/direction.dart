import "package:noter/Utils/packages.dart";


part 'direction.g.dart';
@HiveType(typeId: 1)
enum Direction {
  @HiveField(0)
  non,
  @HiveField(1)
  grid,
  @HiveField(2)
  column
}
