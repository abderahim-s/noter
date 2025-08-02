import "package:noter/Utils/packages.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    _initialize();
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Gif(
          width: 200,
          height: 200,
          image: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? AssetImage("assets/splash_dark.gif")
              : AssetImage("assets/splash.gif"),
          duration: Duration(seconds: 2),
          //fps: 30,
          autostart: Autostart.loop,
          placeholder: (context) => const Text('Loading...'),
        ),
      ),
    );
  }

  void _initialize() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(("/home")); // Navigate to main screen once ready
  }
}
