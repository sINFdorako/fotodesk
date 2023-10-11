import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/file_pick_info.dart';

class PickFilesFromDesktop {
  Future<List<FilePickInfo>?> pickMultipleImages() async {
    List<FilePickInfo> pickedFiles = [];

    // Check if dart:io is available and Platform.isMacOS is true
    bool isMacOS = false;
    try {
      isMacOS = Platform.isMacOS;
    } catch (e) {}

    if (isMacOS) {
      // Non-web platforms: use FilePicker
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: true,
      );

      if (result != null) {
        for (final file in result.files) {
          Uint8List bytesData = File(file.path!).readAsBytesSync();
          Duration estimatedTime = _calculateUploadTime(bytesData.length);
          pickedFiles.add(FilePickInfo(
            bytes: null,
            name: file.name,
            file: File(file.path!),
            imageCount: result.files.length,
            estimatedUploadTime: estimatedTime,
          ));
        }

        return pickedFiles;
      } else {
        return null;
      }
    } else {
      // Assume it's the web if Platform.isMacOS is false or inaccessible

      // Web platform: use native HTML file picker
      final completer = Completer<List<FilePickInfo>>();

      final uploadInput = html.FileUploadInputElement()
        ..multiple = true
        ..draggable = true
        ..click();

      uploadInput.onChange.listen((event) {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          for (final file in files) {
            final reader = html.FileReader();

            reader.onLoadEnd.listen((event) {
              Uint8List bytesData = const Base64Decoder()
                  .convert(reader.result.toString().split(",").last);
              print(bytesData);
              Duration estimatedTime = _calculateUploadTime(bytesData.length);
              pickedFiles.add(FilePickInfo(
                bytes: bytesData,
                name: file.name,
                mimeType: file.type,
                file: null,
                imageCount: files.length,
                estimatedUploadTime: estimatedTime,
              ));

              if (pickedFiles.length == files.length) {
                completer.complete(pickedFiles);
              }
            });
            reader.readAsDataUrl(file);
          }
        }
      });

      return completer.future;
    }
  }

  Duration _calculateUploadTime(int fileSizeInBytes) {
    const averageUploadSpeed = (4 * 1024 * 1024) / 7;
    double estimatedTimeInSeconds = fileSizeInBytes / averageUploadSpeed;
    return Duration(seconds: estimatedTimeInSeconds.round());
  }
}
