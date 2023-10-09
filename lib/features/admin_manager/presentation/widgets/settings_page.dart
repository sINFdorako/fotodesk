import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/notifications/presentation/widgets/notifications.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:fotodesk/features/admin_manager/data/datasources/local_data_source_am.dart';
import 'package:fotodesk/features/admin_manager/presentation/cubit/admin_manager_cubit.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final List<FotodeskPackage> _selectedPackages = [];
  int _appSizeInGB = 5; // default
  String? _apiKey = "";
  int? _applicationSize = 0;

  double _calculatePrice() {
    double galleryPrice =
        _selectedPackages.contains(FotodeskPackage.gallery) ? 3.99 : 0.0;
    double crmPrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.crm) ? 19.99 : 0.0;
    double ecommercePrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.ecommerce) ? 19.99 : 0.0;
    double kanbanPrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.kanban) ? 2.99 : 0.0;

    double storagePrice = (_appSizeInGB - 1) * 0.25;

    double total =
        galleryPrice + crmPrice + ecommercePrice + kanbanPrice + storagePrice;

    return double.parse(total.toStringAsFixed(
        2)); // This will ensure the total is rounded to two decimal places
  }

  String packageTitle(FotodeskPackage package) {
    switch (package) {
      case FotodeskPackage.gallery:
        return 'Galerie';
      case FotodeskPackage.crm:
        return 'CRM';
      case FotodeskPackage.ecommerce:
        return 'E-Commerce';
      case FotodeskPackage.kanban:
        return 'Kanban';
      default:
        return '';
    }
  }

  _getApiKeyPreview() async {
    return await LocalDataSourceAM().getApiKeyPreview();
  }

  Future<void> _initializeApiKeyPreview() async {
    final String apiKeyPreview = await _getApiKeyPreview();
    if (apiKeyPreview != '') {
      setState(() {
        _apiKey = "$apiKeyPreview****************";
      });
    }
  }

  Future<void> _getSizeOfAllImages() async {
    final galleryCubit = context.read<GalleryAdminCubit>();
    final int imageSize = await galleryCubit.getSizeOfAllImages();
    setState(() {
      _applicationSize = imageSize;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeApiKeyPreview();
    _getSizeOfAllImages();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    final adminManagerCubit = context.read<AdminManagerCubit>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Ausgewählte Packete', style: textTheme.titleLarge),
          const SizedBox(height: 20),
          ...FotodeskPackage.values.map((package) {
            bool isGallery = package == FotodeskPackage.gallery;
            _selectedPackages.add(FotodeskPackage.gallery);

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
                border: Border.all(
                  color: isGallery
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(isGallery ? Icons.image : Icons.block,
                    color: isGallery
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey),
                title: Text(
                  packageTitle(package),
                  style: TextStyle(
                      color: isGallery ? Colors.black : Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                trailing: isGallery
                    ? Icon(Icons.check_box_outlined,
                        color: Theme.of(context).colorScheme.primary)
                    : null,
              ),
            );
          }),
          const Divider(),
          const SizedBox(height: 20),
          Column(
            children: <Widget>[
              Card(
                elevation: 4.0, // adjust this for desired shadow depth
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // rounded corners
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // space inside the card
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.sd_storage, // Icon representing storage
                                color: Theme.of(context)
                                    .primaryColor, // Choose an appropriate color
                                size: 24.0, // Adjust the size as needed
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Verfügbarer Speicher: $_appSizeInGB GB',
                                style: TextStyle(fontSize: FontUtil.paragraph),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons
                                    .folder_open, // Icon representing used storage
                                color: Theme.of(context)
                                    .primaryColor, // Choose an appropriate color
                                size: 24.0, // Adjust the size as needed
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Genutzter Speicher: ${FormatFileSize().format(_applicationSize ?? 0)} ',
                                style: TextStyle(fontSize: FontUtil.paragraph),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(
                          height:
                              10), // provides a bit of spacing between text and slider
                      Slider(
                        value: _appSizeInGB.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            _appSizeInGB = newValue.toInt();
                          });
                        },
                        min: 1,
                        max: 50,
                        divisions: 49,
                        label: '$_appSizeInGB GB',
                      ),
                    ],
                  ),
                ),
              ),
              // ... other widgets if any ...
            ],
          ),
          const Divider(),
          const SizedBox(height: 20),
          Text('API Schlüssel', style: textTheme.titleLarge),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _apiKey == '' ? 'Kein API Schlüssel vorhanden' : _apiKey!,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    _apiKey = await adminManagerCubit.updateApiKey();
                    if (_apiKey != null) {
                      await LocalDataSourceAM().saveApiKeyPreview(
                          _apiKey!.substring(0, min(5, _apiKey!.length)));
                      Clipboard.setData(ClipboardData(text: _apiKey!));
                      Notifications(context).showInfo(
                          toastDuration: const Duration(seconds: 15),
                          width: 400.w,
                          height: 300.h,
                          description:
                              'Dein API Schlüssel wurde erfolgreich in der Zwischenablage kopiert.\n \n Bitte bewahre ihn gut auf deinem PC auf, da du ihn in der Applikation aufgrund der Verschlüsselung nicht mehr sehen kannst.\n \n Solltest du Ihn verlieren, musst du dir wieder einen neuen generieren lassen.');
                    }
                    final apiKeyPreview =
                        await LocalDataSourceAM().getApiKeyPreview();
                    setState(() {
                      _apiKey = '$apiKeyPreview****************';
                    });
                  },
                  child: _apiKey != ''
                      ? const Text('API Schlüssel aktualisieren')
                      : const Text('API Schlüssel erstellen')),
            ],
          ),
          const Divider(),
          const SizedBox(height: 20),
          Text(
            'Monatlicher Preis: ${_calculatePrice()} € ',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          // ... add more settings as required.
        ],
      ),
    );
  }
}
