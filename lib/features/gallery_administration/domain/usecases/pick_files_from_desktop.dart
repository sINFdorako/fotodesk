import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

class PickFilesFromDesktop {
  Future<List<dynamic>?> pickMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      // If web platform, return file bytes directly
      if (kIsWeb) {
        return result.files.map((file) => file.bytes).toList();
      }
      // Otherwise, return File objects
      else {
        return result.files.map((file) => File(file.path!)).toList();
      }
    } else {
      return null;
    }
  }
}
