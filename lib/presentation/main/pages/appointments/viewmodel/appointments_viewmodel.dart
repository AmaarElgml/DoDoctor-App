import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../../domain/usecase/appointments_usecase.dart';
import '../../../../base/base_viewmodel.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class AppointmentsViewModel extends BaseViewModel
    with AppointmentsViewModelInput, AppointmentsViewModelOutput {
  final _dataStreamController = BehaviorSubject<AppointmentObject>();

  final AppointmentsUseCase _appointmentsUseCase;

  AppointmentsViewModel(this._appointmentsUseCase);

  @override
  void start() {
    _getAppointmentsData();
  }

  _getAppointmentsData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _appointmentsUseCase.execute(Void)).fold((failure) {
      inputState.add(
          ErrorState(StateRendererType.fullScreenErrorState, failure.message));
    }, (data) {
      inputState.add(ContentState());
      inputAppointmentsData.add(data);
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputAppointmentsData => _dataStreamController.sink;

  @override
  Stream<AppointmentObject> get outputAppointmentsData =>
      _dataStreamController.stream;
}

abstract class AppointmentsViewModelInput {
  Sink get inputAppointmentsData;
}

abstract class AppointmentsViewModelOutput {
  Stream<AppointmentObject> get outputAppointmentsData;
}
