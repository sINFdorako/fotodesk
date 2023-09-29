import 'dart:io';

import 'package:file_picker/file_picker.dart';

class PickFilesFromDesktop {
  Future<List<File>?> pickMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      return result.files.map((file) => File(file.path!)).toList();
    } else {
      return null;
    }
  }
}
