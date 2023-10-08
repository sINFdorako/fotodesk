import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/authentification/data/datasources/local_data_source.dart';
import 'package:fotodesk/features/authentification/domain/entities/user.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;

    return FutureBuilder<User?>(
      future: LocalDataSource().getUser(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Error loading user info.');
        } else {
          final User? user = snapshot.data;

          return Container(
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22.5.r,
                      backgroundColor: theme.colorScheme.primary,
                      child: Icon(
                        Icons.person,
                        size: 16.r,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Unbekannter Nutzer',
                            style: textTheme.headlineSmall),
                        const SizedBox(height: 5),
                        Text(user?.email ?? 'Unbekannte Email',
                            style: textTheme.titleMedium
                                ?.copyWith(color: theme.colorScheme.secondary)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 30),
                _buildInfoRow('Firma:', '--', textTheme),
                const SizedBox(height: 20),
                _buildInfoRow('Position:', '--', textTheme),
                const SizedBox(height: 20),
                _buildInfoRow('Beigetreten:', '--', textTheme),
                const SizedBox(height: 20),
                _buildInfoRow('Zueletzt angemeldet:', '--', textTheme),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildInfoRow(String label, String info, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style:
                textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
        Expanded(
          child: Text(
            info,
            textAlign: TextAlign.right,
            style: textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
