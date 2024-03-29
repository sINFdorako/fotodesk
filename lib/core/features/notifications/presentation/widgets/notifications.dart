import 'dart:async';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/global_font_size.dart';
import 'package:fotodesk/core/features/ui/presentation/widgets/screen_size.dart';

enum ElegantNotificationType { success, error, info }

mixin ElegantNotificationMixin {
  Completer<void>? _dismissCompleter;

  void dismissCurrentNotification() {
    _dismissCompleter?.complete();
  }

  BuildContext get context;

  ElegantNotification _configureElegantNotification({
    required Duration toastDuration,
    required double width,
    required double height,
    required String description,
    required ElegantNotificationType type,
    Widget? customDescription,
  }) {
    final colorMap = {
      ElegantNotificationType.success: Colors.green[400],
      ElegantNotificationType.error: Colors.red[400],
      ElegantNotificationType.info: Theme.of(context).colorScheme.primary,
    };

    late IconData iconData;
    switch (type) {
      case ElegantNotificationType.success:
        iconData = Icons.check;
        break;
      case ElegantNotificationType.error:
        iconData = Icons.error;
        break;
      case ElegantNotificationType.info:
        iconData = Icons.info;
        break;
    }

    return ElegantNotification(
      toastDuration: toastDuration,
      background: Theme.of(context).colorScheme.background,
      showProgressIndicator: false,
      width: width,
      height: height,
      notificationPosition: NotificationPosition.bottomRight,
      animation: ScreenSize.isMobile(context)
          ? AnimationType.fromBottom
          : AnimationType.fromRight,
      description: customDescription ??
          Text(
            description,
            style: TextStyle(
              fontSize: FontUtil.notification,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
      onDismiss: () {},
      onActionPressed: () {
        if (!_dismissCompleter!.isCompleted) {
          _dismissCompleter!.complete();
        }
      },
      icon: Icon(
        iconData,
        color: colorMap[type],
      ),
    );
  }

  void _showElegantNotification({
    required String description,
    required ElegantNotificationType type,
    Duration? toastDuration,
    double? width,
    double? height,
    Widget? customDescription,
  }) {
    width ??= 360.w;
    height ??= 100.h;
    toastDuration ??= const Duration(milliseconds: 3000);

    final notification = _configureElegantNotification(
      width: width,
      height: height,
      toastDuration: toastDuration,
      description: description,
      customDescription: customDescription,
      type: type,
    );
    notification.show(context);
  }
}

class Notifications with ElegantNotificationMixin {
  @override
  final BuildContext context;

  Notifications(this.context);

  void showError({
    required String description,
    Duration? toastDuration,
  }) {
    toastDuration ??= const Duration(milliseconds: 7000);
    _showElegantNotification(
      toastDuration: toastDuration,
      description: description,
      type: ElegantNotificationType.error,
    );
  }

  void showSuccess(String description) {
    _showElegantNotification(
      description: description,
      type: ElegantNotificationType.success,
    );
  }

  void showInfo({
    String? description,
    Duration? toastDuration,
    double? width,
    double? height,
    Widget? customDescription,
  }) {
    width ??= 360.w;
    height ??= 100.h;
    toastDuration ??= const Duration(milliseconds: 5000);

    _showElegantNotification(
      description: description ?? '',
      type: ElegantNotificationType.info,
      toastDuration: toastDuration,
      width: width,
      height: height,
      customDescription: customDescription,
    );
  }
}
