// import 'dart:async';
// import 'dart:convert';
// import 'dart:html' as html;
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:fotodesk/features/gallery_administration/domain/entities/file_pick_info.dart';
// import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

// class PickFilesFromWeb {
//   Future<List<FilePickInfo>?> pickMultipleImages(BuildContext context) async {
//     List<FilePickInfo> pickedFiles = [];
//     final completer = Completer<List<FilePickInfo>>();

//     // Web platform: use native HTML file picker
//     final uploadInput = html.FileUploadInputElement()
//       ..accept = '.jpg, .jpeg, .png'
//       ..multiple = true
//       ..draggable = true
//       ..click();

//     uploadInput.onChange.listen((event) {
//       context.read<GalleryAdminCubit>().acitvateLoading();
//       final files = uploadInput.files;
//       if (files != null && files.isNotEmpty) {
//         for (final file in files) {
//           final reader = html.FileReader();

//           reader.onLoadEnd.listen((event) {
//             Uint8List bytesData = const Base64Decoder()
//                 .convert(reader.result.toString().split(",").last);
//             Duration estimatedTime = _calculateUploadTime(bytesData.length);
//             pickedFiles.add(FilePickInfo(
//               bytes: bytesData,
//               name: file.name,
//               mimeType: file.type,
//               file: null,
//               imageCount: files.length,
//               estimatedUploadTime: estimatedTime,
//             ));

//             if (pickedFiles.length == files.length) {
//               completer.complete(pickedFiles);
//             }
//           });
//           reader.readAsDataUrl(file);
//         }
//       }
//     });

//     return completer.future;
//   }

//   Duration _calculateUploadTime(int fileSizeInBytes) {
//     const averageUploadSpeed = (4 * 1024 * 1024) / 7;
//     double estimatedTimeInSeconds = fileSizeInBytes / averageUploadSpeed;
//     return Duration(seconds: estimatedTimeInSeconds.round());
//   }
// }
