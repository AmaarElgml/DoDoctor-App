import 'package:flutter/material.dart';
import '../../../../../app/di.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/values_manager.dart';
import '../../appointments/viewmodel/appointments_viewmodel.dart';
import 'widgets/appointment_card.dart';

class AppointmentsPage extends StatefulWidget {
  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  final AppointmentsViewModel _viewModel = instance<AppointmentsViewModel>();

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
    return StreamBuilder<AppointmentObject>(
        stream: _viewModel.outputAppointmentsData,
        builder: (context, snapshot) {
          return _getAppointmentWidget(
              snapshot.data?.appointmentData.appointments);
        });
  }

  Widget _getAppointmentWidget(List<Appointment>? appointments) {
    if (appointments != null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
        child: ListView(
          children: appointments
              .map((appointment) => AppointmentCard(appointment))
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
