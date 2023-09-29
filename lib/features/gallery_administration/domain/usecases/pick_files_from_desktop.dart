import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PickFilesFromDesktop {
  Future<File?> pick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }
}
