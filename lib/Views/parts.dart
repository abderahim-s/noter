import "package:noter/Utils/packages.dart";

Widget buildEmptyState() {
  return Center(child: Text("No Notes", style: TextStyle(fontSize: 25)));
}

List<Widget> options(
  BuildContext context,
  HomeController controller,
  OPTIONS option,
) {
  return [
    IconButton(
      onPressed: () {
        Get.defaultDialog(
          content: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                elevation: 2,
                child: screenPickerColor(context, controller),
              ),
            ),
          ),
        );
      },
      icon: Icon(Icons.set_meal),
    ),

    IconButton(
      onPressed: () {
        option == OPTIONS.edit
            ? controller.editNote(controller.currentNote!.id)
            : controller.addNote();
        Get.back();
      },
      icon: Icon(Icons.save),
    ),
  ];
}

Widget screenPickerColor(BuildContext context, HomeController controller) {
  return ColorPicker(
    // Use the screenPickerColor as start and active color.
    color: Colors.blue,
    // Update the screenPickerColor using the callback.
    onColorChanged: (Color color) => {controller.colorTemp = color},
    width: 44,
    height: 44,
    borderRadius: 22,
    heading: Text(
      'Select color',
      style: Theme.of(context).textTheme.headlineSmall,
    ),
    subheading: Text(
      'Select color shade',
      style: Theme.of(context).textTheme.titleSmall,
    ),
  );
}

List<Widget> settingsMenu(HomeController controller) {
  return [
    IconButton(
      onPressed: () {
        Get.defaultDialog(
          title: "settings".tr,
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (c) => RadioListTile(
                        title: Text("english".tr),
                        value: "en",
                        groupValue: controller.language,
                        onChanged: (value) {
                          controller.changeLanguage(value!);
                          Get.back();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (c) => RadioListTile(
                        title: Text("arabic".tr),
                        value: "ar",
                        groupValue: controller.language,
                        onChanged: (value) {
                          controller.changeLanguage(value!);
                          Get.back();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              GetBuilder<HomeController>(
                builder: (c) => SwitchListTile(
                  title: Text("grid".tr),
                  value: controller.direction == Direction.grid,
                  onChanged: (boolean) {
                    controller.toggleview(boolean);
                  },
                ),
              ),
            ],
          ),
        );
      },
      icon: Icon(Icons.settings),
    ),
  ];
}

Widget buildColumnState(BuildContext context, HomeController controller) {
  return ListView.builder(
    itemCount: controller.notes.length,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        tileColor: controller.notes.elementAt(index).color,
        subtitle: Text(
          controller.notes.elementAt(index).description,
          maxLines: 2,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        onLongPress: () {
          Get.defaultDialog(
            title: "warn".tr,
            content: Text("warning".tr, style: TextStyle(fontSize: 15)),
            textConfirm: "Yes",
            textCancel: "No",
            onConfirm: () {
              controller.deleteNote(controller.notes.elementAt(index).id);
              Get.back();
            },
          );
        },
        onTap: () {
          controller.setCurrentNote(index);
          Get.toNamed("/show");
        },
        title: Text(
          controller.notes.elementAt(index).title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(7),
          side: BorderSide(color: Colors.black45, width: 1),
        ),
      ),
    ),
  );
}

Widget buildGridState(HomeController controller) {
  return GridView.count(
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    crossAxisCount: 2,
    children: List.generate(controller.notes.length, (index) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
          tileColor: controller.notes.elementAt(index).color,
          subtitle: Text(
            controller.notes.elementAt(index).description,
            maxLines: 2,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          onLongPress: () {
            Get.defaultDialog(
              title: "warn".tr,
              content: Text("warning".tr, style: TextStyle(fontSize: 15)),
              textConfirm: "Yes",
              textCancel: "No",
              onConfirm: () {
                controller.deleteNote(controller.notes.elementAt(index).id);
                Get.back();
              },
            );
          },
          onTap: () {
            controller.setCurrentNote(index);
            Get.toNamed("/show");
          },
          title: Text(
            controller.notes.elementAt(index).title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(7),
            side: BorderSide(color: Colors.black45, width: 1),
          ),
        ),
      );
    }),
  );
}
