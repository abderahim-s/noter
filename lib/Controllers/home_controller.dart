import "package:noter/Utils/packages.dart";

class HomeController extends GetxController {
  Direction direction = Direction.non;
  String language = "en";
  Storage storage = Get.find<Storage>();
  List<Note> notes = [];
  Note? currentNote;
  Color? colorTemp;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String get title => titleController.text;
  String get description => descriptionController.text;
  List<Note> get reversedNotes => notes.reversed.toList();
  set title(String title) => titleController.text = title;
  set description(String description) =>
      descriptionController.text = description;
  void updateDirection(Direction d) {
    // update type of list inside the storage
    storage.setView(d);
  }

  void addNote() {
    if (title.isNotEmpty || description.isNotEmpty) {
      final key = DateTime.now().millisecondsSinceEpoch;
      if (direction == Direction.non) {
        direction = Direction.column;
      }
      final note = Note(
        key.toString(),
        title,
        description,
        colorTemp ?? Colors.white,
      );

      notes.add(note);
      storage.addNote(key.toString(), note);

      colorTemp = null;
      title = "";
      description = "";
      update();
    }
  }

  void editNote(String id) {
    if (title != currentNote!.title ||
        description != currentNote!.description ||
        colorTemp != currentNote!.color) {
      final index = notes.indexWhere((note) => note.id == id);
      if (index != -1) {
        notes[index] = Note(id, title, description, colorTemp);
        storage.addNote(id, Note(id, title, description, colorTemp));
        colorTemp = null;
        title = "";
        description = "";
        colorTemp = null;
        update();
      }
    }
  }

  void setCurrentNote(int index) {
    currentNote = notes[index];
    titleController.text = currentNote!.title;
    descriptionController.text = currentNote!.description;
    colorTemp = currentNote!.color;
  }

  void deleteNote(String id) {
    notes.removeWhere((note) {
      return (note.id == id);
    });
    if (notes.isEmpty) {
      direction = Direction.non;
      updateDirection(Direction.non);
    }
    storage.deleteNote(id);
    update();
  }

  void toggleview(bool boolean) {
    if (boolean) {
      direction = Direction.grid;
      updateDirection(Direction.grid);
    } else {
      direction = Direction.column;
      updateDirection(Direction.column);
    }
    update();
  }

  void changeLanguage(String lang) {
    language = lang;
    storage.setLanguage(lang);
    Get.updateLocale(Locale(lang));
  }

  @override
  void onInit() {
    language = storage.getLanguage()!;
    direction = storage.getView();
    notes = List.from(storage.getNotes());
    if (notes.isNotEmpty && direction == Direction.non) {
      direction = Direction.column;
    }
    super.onInit();
  }

  @override
  void onReady() {
    Get.updateLocale(Locale(language));
    super.onReady();
  }

  setColor(Color color) {
    if (currentNote != null) {
      currentNote!.color = color;
      storage.addNote(currentNote!.id, currentNote!);
      update();
    }
  }
}
