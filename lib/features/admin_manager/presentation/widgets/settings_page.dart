import 'package:flutter/material.dart';
import 'package:fotodesk/features/authentification/domain/entities/fotodesk_setting.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  final List<FotodeskPackage> _selectedPackages = [];
  int _appSizeInGB = 5; // default
  final String _apiKey = "a5b3c**************";

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

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;

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
          Text('Ausgewählter Speicher $_appSizeInGB GB',
              style: textTheme.titleLarge),
          Slider(
            value: _appSizeInGB.toDouble(),
            onChanged: (newValue) {
              setState(() {
                _appSizeInGB = newValue.toInt();
              });
            },
            min: 1,
            max: 50,
            divisions: 49, // for integer values between 1 and 50
            label: '$_appSizeInGB GB',
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
                  _apiKey,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Function to update API key goes here
                },
                child: const Text('API Schlüssel aktualisieren'),
              ),
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
