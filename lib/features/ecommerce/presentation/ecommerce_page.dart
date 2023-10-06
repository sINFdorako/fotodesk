import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/custom_button.dart';
import 'package:fotodesk/features/generative_chat/presentation/widgets/sales_analytics_chart.dart';

class EcommerceViewBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final double? doubleNumber;
  final int number;
  final String? currency;

  const EcommerceViewBox({
    super.key,
    required this.icon,
    required this.title,
    required this.number,
    this.doubleNumber,
    this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(0.2), // Adjust the opacity as required for subtlety
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Theme.of(context).colorScheme.primary.withOpacity(.1),
      elevation: 0, // No shadow since it's transparent
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 33,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withOpacity(.85),
              child: Icon(
                icon,
                size: 22, // Adjust the size to fit well within the CircleAvatar
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 32),
            Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Added for alignment
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(.8),
                        Colors.white.withOpacity(.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${doubleNumber ?? number}${currency ?? ''}',
                    style: TextStyle(
                      color: Colors.black87.withOpacity(.65),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Courier New', // Monospace font for a "machinery" feel
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EcommercePage extends StatefulWidget {
  const EcommercePage({super.key});

  @override
  State<EcommercePage> createState() => _EcommercePageState();
}

class _EcommercePageState extends State<EcommercePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EcommerceViewBox(
                  icon: Icons
                      .euro_rounded, // Euro symbol representing total sales
                  title: 'Gesamteinnahmen',
                  doubleNumber: 3.235,
                  number: 0,
                  currency: '€',
                ),
                SizedBox(
                  width: 16,
                ),
                EcommerceViewBox(
                  icon:
                      Icons.assignment, // Document-like symbol for total orders
                  title: 'Gesamtverkäufe',
                  number: 54,
                ),
                SizedBox(
                  width: 16,
                ),
                EcommerceViewBox(
                  icon: Icons
                      .picture_in_picture_alt, // Star symbol for best-selling product
                  title: 'Anzahl Produkte',
                  number:
                      25, // This could be the count of the best-selling product
                ),
                SizedBox(
                  width: 16,
                ),
                EcommerceViewBox(
                  icon: Icons.person, // Person symbol for visitors today
                  title: 'Gesamtbesucher',
                  number:
                      978, // This could be the number of visitors for the day
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 91.5.w, right: 91.5.w),
            padding: const EdgeInsets.all(
                32), // Add padding to all sides of the container.
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondary
                  .withOpacity(.1), // A light background color.
              borderRadius: BorderRadius.circular(10.0), // Rounded corners.
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400]!
                      .withOpacity(0.2), // Shadow with a bit of transparency.
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // Position of the shadow.
                ),
              ],
              border: Border.all(
                  color: Colors.grey[300]!,
                  width: 1), // A thin border for distinction.
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: 400.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Verkauf Statistik',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 5, backgroundColor: Colors.indigo[700]),
                          const SizedBox(width: 5),
                          const Text('Mai'),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 5, backgroundColor: Colors.pink[400]),
                          const SizedBox(width: 5),
                          const Text('Juni'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Filter action here
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Filter: Mai | Juni 2023'),
                      ),
                    ],
                  ),
                  SizedBox(height: 64.h),
                  const Expanded(child: SalesChart()),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          // Placeholder for product management tool
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: const Center(child: Text('Product Management Placeholder')),
          ),
        ],
      ),
    );
  }
}
