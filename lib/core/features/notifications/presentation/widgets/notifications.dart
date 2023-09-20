import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';

enum ElegantNotificationType { success, error }

mixin ElegantNotificationMixin {
  BuildContext get context;

  ElegantNotification _configureElegantNotification({
    required String description,
    required ElegantNotificationType type,
  }) {
    final colorMap = {
      ElegantNotificationType.success: Colors.green[400],
      ElegantNotificationType.error: Colors.red[400],
    };

    late final IconData iconData;
    switch (type) {
      case ElegantNotificationType.success:
        iconData = Icons.check;
        break;
      case ElegantNotificationType.error:
        iconData = Icons.error;
        break;
    }

    return ElegantNotification(
      background: Theme.of(context).colorScheme.background,
      showProgressIndicator: false,
      width: 360,
      notificationPosition: NotificationPosition.bottomRight,
      animation: AnimationType.fromRight,
      description: Text(
        description,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
      onDismiss: () {},
      icon: Icon(
        iconData,
        color: colorMap[type],
      ),
    );
  }

  void _showElegantNotification({
    required String description,
    required ElegantNotificationType type,
  }) {
    final notification = _configureElegantNotification(
      description: description,
      type: type,
    );
    notification.show(context);
  }
}

class Notifications with ElegantNotificationMixin {
  @override
  final BuildContext context;

  Notifications(this.context);

  void showError(String description) {
    _showElegantNotification(
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
}
