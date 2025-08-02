import "package:noter/Utils/packages.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();

  runApp(const MyApp());
}

Future initializeServices() async {
  await Get.putAsync(() => Storage().init(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? darkTheme
          : lightTheme,
      translations: Local(),
      getPages: [
        GetPage(
          name: "/home",
          page: () => Home(),
          binding: BindingsBuilder(() {
            Get.put(HomeController(), permanent: true);
          }),
        ),
        GetPage(
          name: "/new",
          page: () => AddNote(),
          transition: Transition.native,
        ),
        GetPage(
          name: "/show",
          page: () => ShowNote(),
          transition: Transition.zoom,
        ),
        GetPage(name: "/", page: () => SplashScreen()),
      ],
    );
  }
}
