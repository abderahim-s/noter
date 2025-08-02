import "package:noter/Utils/packages.dart";

class Storage extends GetxService {
  bool _initialized = false;
  late Box<Prefs> _prefs;
  late Box<Note> _data;
  Future<Storage> init() async {
    if (_initialized) return this;
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _registerAdapters();
    _data = await getBox<Note>("notes");
    _prefs = await getBox<Prefs>("prefs");
    if (_prefs.isEmpty) {
      initializePrefs();
    }
    _initialized = true;
    return this;
  }

  Future<Box<T>> getBox<T>(String boxname) async {
    if (!Hive.isBoxOpen(boxname)) {
      return Hive.openBox<T>(boxname);
    }
    return Hive.box<T>(boxname);
  }

  Future<void> _registerAdapters() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ColorAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(NoteAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(DirectionAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(PrefsAdapter());
    }
  }

  void initializePrefs() {
    _prefs.put("prefs", Prefs());
  }

  Future<void> setLanguage(String code) async {
    _prefs.get("prefs")!.language = code;
    saveChanges();
  }

  String? getLanguage() {
    return _prefs.get("prefs")!.language;
  }

  Future<void> setView(Direction listType) async {
    _prefs.get("prefs")!.direction = listType;
    saveChanges();
  }

  Direction getView() {
    return _prefs.get("prefs")!.direction;
  }

  void addNote(String key, Note note) {
    _data.put(key, note);
  }

  Future<void> deleteNote(String id) async {
    _data.delete(id);
  }

  List<Note> getNotes() {
    if (_data.isEmpty) return List<Note>.empty();
    return [for (var note in _data.values) note];
  }

  int getListSize() {
    return getNotes().isEmpty ? 0 : getNotes().length;
  }

  void setnotes(List<Note> notes) {
    _data.clear();
    for (var note in notes) {
      addNote(note.id, note);
    }
  }

  void saveChanges() {
    _prefs.put("prefs", _prefs.get("prefs")!);
  }
}
