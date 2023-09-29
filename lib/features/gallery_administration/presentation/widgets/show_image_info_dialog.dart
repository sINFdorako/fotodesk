import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/gallery_image.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/transform_date.dart';

class ShowImageInfoDialog {
  Future<void> show(BuildContext context, GalleryImage imageMarked) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          width: 600.w,
          height: 600.h,
          title: Text(imageMarked.originalFilename ?? "Image Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMetadataItem('Titel', imageMarked.title),
                _buildMetadataItem('Beschreibung', imageMarked.description),
                _buildMetadataItem(
                    'Dateigröße',
                    imageMarked.fileSize != null
                        ? FormatFileSize().format(imageMarked.fileSize!)
                        : 'Unbekannte Bytes'),
                _buildMetadataItem('MIME Typ', imageMarked.mimeType),
                _buildMetadataItem('Hochladedatum',
                    TransformDate().getDate(imageMarked.uploadDate!)),
                _buildMetadataItem('Letztes Änderungsdatum',
                    TransformDate().getDate(imageMarked.lastModifiedDate!)),
                const Divider(),
                const Text('EXIF Daten',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                _buildMetadataItem('Kamera Marke', imageMarked.cameraMake),
                _buildMetadataItem('Kamera Modell', imageMarked.cameraModel),
                _buildMetadataItem(
                    'Belichtungszeit', '${imageMarked.exposureTime}'),
                _buildMetadataItem('Blende', '${imageMarked.aperture}'),
                _buildMetadataItem('ISO', '${imageMarked.iso}'),
                _buildMetadataItem(
                    'Brennweite', '${imageMarked.focalLength}mm'),
                _buildMetadataItem('Blitz verwendet',
                    imageMarked.flashUsed == true ? 'Ja' : 'Nein'),
                const Divider(),
                const Text('IPTC Daten',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                _buildMetadataItem('Ersteller', imageMarked.creator),
                _buildMetadataItem('Urheberrecht', imageMarked.copyright),
                _buildMetadataItem(
                    'Erstellungsdatum', '${imageMarked.creationDate}'),
                const SizedBox(height: 16.0),
                if (imageMarked.tags != null && imageMarked.tags!.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    children: imageMarked.tags!
                        .map((tag) => Chip(label: Text(tag)))
                        .toList(),
                  )
              ],
            ),
          ),
          actions: [
            CustomButton(
              label: 'Schließen',
              onPressed: () async => {Navigator.of(context).pop()},
            ),
          ],
        );
      },
    );
  }

  Widget _buildMetadataItem(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(
              width: 16.0), // Add some spacing between the label and value
          Expanded(
            flex: 3,
            child: Text(
              value == 'null' || value == null ? '--' : value,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
