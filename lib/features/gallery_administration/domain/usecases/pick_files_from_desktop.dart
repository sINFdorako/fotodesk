import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/file_pick_info.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

class PickFilesFromDesktop {
  Future<List<FilePickInfo>?> pickMultipleImages(BuildContext context) async {
    List<FilePickInfo> pickedFiles = [];

    // Non-web platforms: use FilePicker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      context.read<GalleryAdminCubit>().acitvateLoading();
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
  }

  Duration _calculateUploadTime(int fileSizeInBytes) {
    const averageUploadSpeed = (4 * 1024 * 1024) / 7;
    double estimatedTimeInSeconds = fileSizeInBytes / averageUploadSpeed;
    return Duration(seconds: estimatedTimeInSeconds.round());
  }
}
