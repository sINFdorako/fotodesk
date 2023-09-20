import 'package:flutter/material.dart';

class GalleryAdministrationPage extends StatefulWidget {
  const GalleryAdministrationPage({Key? key}) : super(key: key);

  @override
  State<GalleryAdministrationPage> createState() =>
      _GalleryAdministrationPageState();
}

class _GalleryAdministrationPageState extends State<GalleryAdministrationPage> {
  List<String> categories = [
    'Nature',
    'Portraits',
    'Travel',
    'Animals',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.folder),
          title: Text(categories[index]),
          onTap: () {},
        );
      },
    );
  }
}

Future<void> addNewCategory(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController controller = TextEditingController();
      return AlertDialog(
        title: const Text('New Category'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter category name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
