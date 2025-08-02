import "package:noter/Utils/packages.dart";

class Home extends GetView<HomeController> {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("note".tr), actions: settingsMenu(controller)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/new");
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.direction == Direction.column) {
              return buildColumnState(context, controller);
            }
            if (controller.direction == Direction.non) {
              return buildEmptyState();
            } else {
              return buildGridState(controller);
            }
          },
        ),
      ),
    );
  }
}
