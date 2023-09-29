import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_dialog.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/gallery_image.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/transform_date.dart';

class ShowImageInfoDialog {
  Future<void> show(BuildContext context, List<GalleryImage> imageMarked) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          width: 600.w,
          height: 600.h,
          title: Text(imageMarked[0].originalFilename ?? "Image Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMetadataItem('Titel', imageMarked[0].title),
                _buildMetadataItem('Beschreibung', imageMarked[0].description),
                _buildMetadataItem(
                    'Dateigröße',
                    imageMarked[0].fileSize != null
                        ? FormatFileSize().format(imageMarked[0].fileSize!)
                        : 'Unbekannte Bytes'),
                _buildMetadataItem('MIME Typ', imageMarked[0].mimeType),
                _buildMetadataItem('Hochladedatum',
                    TransformDate().getDate(imageMarked[0].uploadDate!)),
                _buildMetadataItem('Letztes Änderungsdatum',
                    TransformDate().getDate(imageMarked[0].lastModifiedDate!)),
                const Divider(),
                const Text('EXIF Daten',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                _buildMetadataItem('Kamera Marke', imageMarked[0].cameraMake),
                _buildMetadataItem('Kamera Modell', imageMarked[0].cameraModel),
                _buildMetadataItem(
                    'Belichtungszeit', '${imageMarked[0].exposureTime}'),
                _buildMetadataItem('Blende', '${imageMarked[0].aperture}'),
                _buildMetadataItem('ISO', '${imageMarked[0].iso}'),
                _buildMetadataItem(
                    'Brennweite', '${imageMarked[0].focalLength}mm'),
                _buildMetadataItem('Blitz verwendet',
                    imageMarked[0].flashUsed == true ? 'Ja' : 'Nein'),
                const Divider(),
                const Text('IPTC Daten',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                _buildMetadataItem('Ersteller', imageMarked[0].creator),
                _buildMetadataItem('Urheberrecht', imageMarked[0].copyright),
                _buildMetadataItem(
                    'Erstellungsdatum', '${imageMarked[0].creationDate}'),
                const SizedBox(height: 16.0),
                if (imageMarked[0].tags != null &&
                    imageMarked[0].tags!.isNotEmpty)
                  Wrap(
                    spacing: 8.0,
                    children: imageMarked[0]
                        .tags!
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0.w,
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
                fontSize: 14.0.w,
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
