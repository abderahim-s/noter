import "package:noter/Utils/packages.dart";

part 'prefs.g.dart';

@HiveType(typeId: 2)
class Prefs extends HiveObject {
  @HiveField(0)
  Direction direction;
  @HiveField(1)
  String language;
  Prefs([this.direction = Direction.non, this.language = "en"]);

  void setDirection(Direction d) {
    direction = d;
  }

  Direction getDirection() => direction;
  String getLanguage() => language;

  void setLanguage(String l) {
    language = l;
  }
}
