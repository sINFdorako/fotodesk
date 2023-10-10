import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/features/authentification/presentation/cubit/auth_cubit.dart';
import 'package:fotodesk/features/gallery_administration/domain/usecases/transform_date.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    final user = context.read<AuthCubit>().state.user;

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
                  Text('${user?.prename ?? 'Unbekannt'}${user?.surname ?? ''}',
                      style: textTheme.headlineSmall),
                  const SizedBox(height: 5),
                  Text(user?.email ?? 'Unbekannte Email',
                      style: textTheme.titleMedium
                          ?.copyWith(color: theme.colorScheme.primary)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 30),
          _buildInfoRow('Firma:', user?.company ?? '--', textTheme),
          const SizedBox(height: 20),
          _buildInfoRow('Position:', user?.position ?? '--', textTheme),
          const SizedBox(height: 20),
          _buildInfoRow(
              'Beigetreten:',
              user?.registered != null
                  ? TransformDate().getDate(user!.registered!)
                  : '--',
              textTheme),
          const SizedBox(height: 20),
          _buildInfoRow(
              'Zueletzt angemeldet:',
              user?.lastLogin != null
                  ? TransformDate().getDate(user!.registered!)
                  : '--',
              textTheme),
        ],
      ),
    );
  }
}

Widget _buildInfoRow(String label, String info, TextTheme textTheme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
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
