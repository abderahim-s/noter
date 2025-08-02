import "package:noter/Utils/packages.dart";

class AddNote extends StatelessWidget {
  AddNote({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("newnote".tr),
        actions: options(context, controller, OPTIONS.add)
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              enableInteractiveSelection: true,
              onChanged: (title) {
                controller.titleController.text = title;
              },
              decoration: InputDecoration(
                hint: Text("title".tr),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              enableInteractiveSelection: true,
              onChanged: (description) {
                controller.descriptionController.text = description;
              },
              maxLines: 10,
              decoration: InputDecoration(
                hint: Text("body".tr),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
