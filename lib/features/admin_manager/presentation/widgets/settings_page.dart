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
import 'package:fotodesk/features/authentification/domain/entities/user.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/format_file_size.dart';
import 'package:fotodesk/features/gallery_administration/presentation/cubit/gallery_admin_cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final List<String> _selectedPackages = [];
  String? _apiKey = "";
  int? _applicationSize = 0;

  double _calculatePrice(int appSizeInGB) {
    double galleryPrice = _selectedPackages.contains('gallery') ? 3.99 : 0.0;
    double crmPrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.crm) ? 19.99 : 0.0;
    double ecommercePrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.ecommerce) ? 19.99 : 0.0;
    double kanbanPrice = 0.0;
    // _selectedPackages.contains(FotodeskPackage.kanban) ? 2.99 : 0.0;

    double storagePrice = (appSizeInGB - 1) * 0.25;

    double total =
        galleryPrice + crmPrice + ecommercePrice + kanbanPrice + storagePrice;

    return double.parse(total.toStringAsFixed(
        2)); // This will ensure the total is rounded to two decimal places
  }

  String packageTitle(String package) {
    switch (package) {
      case 'gallery':
        return 'Galerie';
      case 'crm':
        return 'CRM';
      case 'e-commerce':
        return 'E-Commerce';
      case 'kanban':
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
    final adminManangerCubit = context.read<AdminManagerCubit>();
    List<String> packages = [];

    FotodeskSetting fotodeskSetting =
        const FotodeskSetting(packages: [], appSizeInGB: 0);

    if (adminManangerCubit.state.setting != null) {
      packages = adminManangerCubit.state.setting!.packages;
      fotodeskSetting = adminManangerCubit.state.setting!;
    }

    final User? user = context.read<AuthCubit>().state.user;
    final adminManagerCubit = context.read<AdminManagerCubit>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Ausgewählte Packete', style: TextStyle(fontSize: FontUtil.h2)),
          const SizedBox(height: 20),
          ...packages.map((package) {
            bool isAllowedPackage(String package) {
              // Superadmin can access all
              if (user?.role == UserRole.superadmin) return true;
              // Gallery is always accessible
              if (package == 'gallery') return true;
              // Other packages are not accessible for regular users
              return false;
            }

            bool isSelectedPackage = _selectedPackages.contains(package);
            if (isAllowedPackage(package) && !isSelectedPackage) {
              _selectedPackages.add(package);
            }

            Color packageColor =
                isAllowedPackage(package) ? Colors.black87 : Colors.grey;

            IconData getIconForPackage(String package) {
              if (package == 'gallery') return Icons.image;
              if (package == 'crm') return Icons.person; // example icon for CRM
              if (package == 'e-commerce') {
                return Icons.shopping_cart; // example icon for e-commerce
              }
              if (package == 'kanban') {
                return Icons.dashboard; // example icon for kanban
              }
              return Icons.block; // default
            }

            IconData packageIcon = getIconForPackage(package);

            Color iconColor = isAllowedPackage(package)
                ? Theme.of(context).colorScheme.primary
                : Colors.grey;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: packageColor,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(packageIcon, color: iconColor),
                title: Text(
                  packageTitle(package),
                  style: TextStyle(
                      color: packageColor,
                      fontSize: FontUtil.button,
                      fontWeight: FontWeight.bold),
                ),
                trailing: isSelectedPackage
                    ? Icon(Icons.check_box_outlined,
                        color: Theme.of(context).colorScheme.primary)
                    : null,
              ),
            );
          }).toList(),

          const Divider(),
          SizedBox(height: 32.h),
          Column(
            children: <Widget>[
              Padding(
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
                              'Verfügbarer Speicher: ${fotodeskSetting.appSizeInGB} GB',
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
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
              // ... other widgets if any ...
            ],
          ),
          const Divider(),
          SizedBox(height: 32.h),
          Text(
            'API Schlüssel',
            style: TextStyle(fontSize: FontUtil.h2),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _apiKey == '' ? 'Kein API Schlüssel vorhanden' : _apiKey!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: FontUtil.button),
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
          SizedBox(height: 32.h),
          const Divider(),
          SizedBox(height: 32.h),
          Text(
            'Ihr individueller monatlicher Preis: ${fotodeskSetting.pricePerMonth} € ',
            style: TextStyle(fontSize: FontUtil.paragraph),
          ),
          const SizedBox(height: 20),
          // ... add more settings as required.
        ],
      ),
    );
  }
}
