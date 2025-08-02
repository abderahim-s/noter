import "package:noter/Utils/packages.dart";

part 'note.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String description;
  @HiveField(3)
  Color? color;
  Note(this.id, this.title, this.description, [this.color = Colors.white]);

  set setTitle(String title) {
    this.title = title;
  }

  set setColor(Color color) {
    this.color = color;
  }

  set setDescription(String description) {
    this.description = description;
  }

  Color? get getColor => color;
}
