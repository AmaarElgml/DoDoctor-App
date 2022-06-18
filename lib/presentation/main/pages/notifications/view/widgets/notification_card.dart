import 'package:flutter/material.dart';

import '../../../../../../domain/model/main_models.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(this.notification, {Key? key}) : super(key: key);

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    return Card(
        color:
            notification.reed ? ColorManager.white : ColorManager.lightBlueGrey,
        shape: defaultCardShape,
        child: ListTile(
          leading: Image.network(notification.image,
              fit: BoxFit.contain, height: 32, color: ColorManager.primary),
          title: Text(notification.title,
              style: Theme.of(context).textTheme.titleMedium),
          subtitle: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child:
                Text('13 May 2022', style: Theme.of(context).textTheme.caption),
          ),
          onTap: () {},
        ));
  }
}
