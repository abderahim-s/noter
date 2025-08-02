import 'package:noter/Utils/packages.dart';

class ShowNote extends StatelessWidget {
  ShowNote({super.key});

  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: controller.currentNote!.color == Colors.white
            ? Theme.of(context).appBarTheme.backgroundColor
            : controller.currentNote!.color,
        actionsIconTheme: IconThemeData(
          color: controller.currentNote!.color!.computeLuminance() > 0.5
              ? Colors.black
              : Colors.white,
        ),
        actions: options(context, controller, OPTIONS.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GetBuilder<HomeController>(
          builder: (contrlr) => Column(
            children: [
              TextField(
                style: Theme.of(context).textTheme.bodySmall,
                controller: controller.titleController,
                enableInteractiveSelection: true,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              SizedBox(height: 10),
              TextField(
                style: Theme.of(context).textTheme.bodySmall,
                controller: controller.descriptionController,
                enableInteractiveSelection: true,
                maxLines: 10,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
