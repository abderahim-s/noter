import "package:noter/Utils/packages.dart";

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(bodySmall: TextStyle(color: Colors.black, fontSize: 18)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFDCD0A8),
    foregroundColor: Colors.black,
  ),
  primaryColor: Color(0xFF004030),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xFFDCD0A8)),
    backgroundColor: Color(0xFF004030),
    titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
  ),
);
ThemeData darkTheme = ThemeData(
  textTheme: TextTheme(bodySmall: TextStyle(color: Colors.white, fontSize: 18)),
  scaffoldBackgroundColor: Colors.black,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFE67514),
    foregroundColor: Colors.black,
  ),
  primaryColor: Colors.black,
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Color(0xFF06923E)),
    backgroundColor: Color(0xFFE67514),
    titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
  ),
);
