import 'package:flutter/material.dart';
import '../../../../../app/di.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/values_manager.dart';
import '../viewmodel/notifications_viewmodel.dart';
import 'widgets/notification_card.dart';
import '../../../../../domain/model/main_models.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final NotificationsViewModel _viewModel = instance<NotificationsViewModel>();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.start();
              }) ??
              _getContentWidget();
        });
  }

  Widget _getContentWidget() {
    return StreamBuilder<NotificationObject>(
        stream: _viewModel.outputNotificationsData,
        builder: (context, snapshot) {
          return _getNotificationsWidget(
              snapshot.data?.notification.notifications);
        });
  }

  Widget _getNotificationsWidget(List<AppNotification>? notifications) {
    if (notifications != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
        child: ListView(
          children: notifications
              .map((notification) => NotificationCard(notification))
              .toList(),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
