import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/category.dart';
import 'package:fotodesk/features/gallery_administration/domain/entities/gallery_image.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/transform_date.dart';

class FileSystem {
  // have a generic file system which can be used across several features
  // gallery administration, crm

  // list tile of file system
  Widget listTilePersonalGallery(dynamic fileItem,
      {required bool isSelected,
      required int index,
      required void Function()? onTapOpenListTile,
      required void Function()? onTapMarkListTile,
      required void Function(bool?)? checkBoxOnChanged,
      required BuildContext context}) {
    return InkWell(
      onTap: onTapOpenListTile,
      child: Container(
        color: determineTileColor(isSelected, index, context),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            _checkBox(onTapMarkListTile, isSelected, checkBoxOnChanged),
            const SizedBox(
              width: 16,
            ),
            fileItem is GalleryImage
                ? Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Image.network(
                        "https://backend.fotogalerie-wolfram-wildner.de/${fileItem.url!}",
                        fit: BoxFit.fitWidth,
                        width: 65.w,
                        height: 100.h,
                      ),
                    ),
                  )
                : Container(),
            Expanded(
              flex: 2,
              child: Text(
                  fileItem is GalleryImage
                      ? fileItem.originalFilename
                      : fileItem.name,
                  style: TextStyle(fontSize: 12.w)),
            ),
            Expanded(
              flex: 1,
              child: Text(
                fileItem is GalleryImage
                    ? FormatFileSize().format(fileItem.fileSize ?? 0).toString()
                    : FormatFileSize().format(fileItem.size ?? 0).toString(),
                style: TextStyle(fontSize: 12.w),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(TransformDate().getDate(fileItem.lastModifiedDate),
                  style: TextStyle(fontSize: 12.w)),
            ),
            Expanded(
              flex: 2,
              child: Text(_determineFileType(fileItem),
                  style: TextStyle(fontSize: 12.w)),
            ),
          ],
        ),
      ),
    );
  }

  headerPersonalGallery(bool isGalleryImage, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const SizedBox(
              width: 55,
            ),
            if (isGalleryImage)
              Expanded(
                flex: 2,
                child: Text('Bild', style: TextStyle(fontSize: 12.5.w)),
              ),
            Expanded(
              flex: 2,
              child: Text('Name', style: TextStyle(fontSize: 12.5.w)),
            ),
            Expanded(
              flex: 1,
              child: Text('Größe', style: TextStyle(fontSize: 12.5.w)),
            ),
            Expanded(
              flex: 2,
              child: Text('Zuletzt bearbeitet',
                  style: TextStyle(fontSize: 12.5.w)),
            ),
            Expanded(
              flex: 2,
              child: Text('Art', style: TextStyle(fontSize: 12.5.w)),
            ),
          ],
        ),
      ),
    );
  }

  headerCRM(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(.1),
            width: 1.0,
          ),
        ),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(200.0),
              1: FixedColumnWidth(200.0),
              2: FixedColumnWidth(200.0),
              3: FixedColumnWidth(200.0),
              4: FixedColumnWidth(200.0),
              5: FixedColumnWidth(200.0),
              6: FixedColumnWidth(200.0),
              7: FixedColumnWidth(200.0),
              8: FixedColumnWidth(200.0),
              9: FixedColumnWidth(200.0),
              10: FixedColumnWidth(200.0),
              11: FixedColumnWidth(200.0),
              12: FixedColumnWidth(200.0),
              13: FixedColumnWidth(200.0),
              14: FixedColumnWidth(200.0),
              15: FixedColumnWidth(200.0),
              16: FixedColumnWidth(200.0),
              17: FixedColumnWidth(200.0),
              18: FixedColumnWidth(200.0),
              19: FixedColumnWidth(200.0),
              20: FixedColumnWidth(200.0),
              21: FixedColumnWidth(200.0),
              22: FixedColumnWidth(200.0),
              23: FixedColumnWidth(200.0),
              24: FixedColumnWidth(200.0),
              25: FixedColumnWidth(200.0),
              26: FixedColumnWidth(200.0),
              27: FixedColumnWidth(200.0),
              28: FixedColumnWidth(200.0)
            }, children: [
              TableRow(children: [
                TableCell(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('Auswahl', style: TextStyle(fontSize: 12.5.w)),
                )),
                TableCell(
                    child:
                        Text('KundenId', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Vorname', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Nachname', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Titel', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Firmenname', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Position', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Email', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Festnetz', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Telefon', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Webseite', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Instagram', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Facebook', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('TikTok', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Straße', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Hausnummer', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Postleitzahl',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Stadt', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Bundesland', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Land', style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Geburtsdatum',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Lifecycle Position',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Anz. Buchungen',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Letzter Termin',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Gesamt Einnahmen',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Off. Rechnungen',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child: Text('Kundenrabatt',
                        style: TextStyle(fontSize: 12.5.w))),
                TableCell(
                    child:
                        Text('Newsletter', style: TextStyle(fontSize: 12.5.w))),
              ])
            ])));
  }

  TableRow createTableRow(
      List<Widget> cells, bool isSelected, int index, BuildContext context) {
    return TableRow(
      decoration: BoxDecoration(
        color: determineTileColor(isSelected, index, context),
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
      ),
      children: cells.map((cell) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: cell,
        );
      }).toList(),
    );
  }

  String _determineFileType(dynamic fileItem) {
    if (fileItem is Category) {
      return 'Ordner';
    } else if (fileItem is GalleryImage) {
      return fileItem.mimeType ?? '--';
    } else {
      return '--'; // default if the type is not determined
    }
  }

  Color? determineTileColor(bool isSelected, int index, BuildContext context) {
    if (isSelected) {
      return Theme.of(context).colorScheme.secondary;
    } else if (index % 2 == 0) {
      return Theme.of(context).colorScheme.primary.withOpacity(.1);
    } else {
      return Theme.of(context).colorScheme.surface;
    }
  }

  _checkBox(void Function()? onTapMarkListTile, bool isSelected,
      void Function(bool? p1)? checkBoxOnChanged) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: InkWell(
          onTap: onTapMarkListTile,
          child: Checkbox(
            value: isSelected,
            onChanged: checkBoxOnChanged,
          ),
        ),
      ),
    );
  }
}
