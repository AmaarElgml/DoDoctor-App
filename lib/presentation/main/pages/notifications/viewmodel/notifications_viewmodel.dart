import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';
import '../../../../../domain/model/main_models.dart';
import '../../../../../domain/usecase/notifications_usecase.dart';
import '../../../../base/base_viewmodel.dart';
import '../../../../common/state_renderer/state_renderer.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

class NotificationsViewModel extends BaseViewModel
    with NotificationsViewModelInput, NotificationsViewModelOutput {
  final _dataStreamController = BehaviorSubject<NotificationObject>();

  final NotificationsUseCase _notificationsUseCase;

  NotificationsViewModel(this._notificationsUseCase);

  @override
  void start() {
    _getNotificationsData();
  }

  _getNotificationsData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));

    (await _notificationsUseCase.execute(Void)).fold(
            (failure) => {
          inputState.add(ErrorState(
              StateRendererType.fullScreenErrorState, failure.message))
        }, (data) {
      inputState.add(ContentState());
      inputNotificationsData.add(data);
    });
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputNotificationsData => _dataStreamController.sink;

  @override
  Stream<NotificationObject> get outputNotificationsData =>
      _dataStreamController.stream;
}

abstract class NotificationsViewModelInput {
  Sink get inputNotificationsData;
}

abstract class NotificationsViewModelOutput {
  Stream<NotificationObject> get outputNotificationsData;
}
