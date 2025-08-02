import "package:noter/Utils/packages.dart";

class Local implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "ar": {
      "body": "المحتوى",
      "title": "العنوان",
      "warning": "هل أنت متأكد أنك  تريد مسح الملاحظة؟",
      "newnote": "ملاحظة جديدة",
      "warn": "تحذير",
      "note": "ملاحظاتي",
      "message": "اختر لغتك المفضلة",
      "settings": "اعدادات",
      "arabic": "عربي",
      "english": "انجليزي",
      "grid": "شبكي",
    },
    "en": {
      "body": "body",
      "title": "title",
      "warning": "are you sure want to delete the note?",
      "newnote": "New note",
      "note": "My Notes",
      "warn": "Warning",
      "message": "Choose your language",
      "settings": "Settings",
      "arabic": "AR",
      "english": "EN",
      "grid": "Grid",
    },
  };
}
