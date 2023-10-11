import 'dart:io';

import 'package:flutter/services.dart';

class FilePickInfo {
  final Uint8List? bytes;
  final String? name;
  final File? file;
  final int? imageCount;
  final Duration? estimatedUploadTime;
  final String? mimeType;

  FilePickInfo(
      {this.bytes,
      this.name,
      this.file,
      this.imageCount,
      this.estimatedUploadTime,
      this.mimeType});
}
