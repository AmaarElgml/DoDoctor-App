import 'dart:async';
import '../../../app/functions.dart';
import '../../../domain/usecase/forgot_password_usecase.dart';
import '../../base/base_viewmodel.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordViewModel(this._forgotPasswordUseCase);

  String email = "";

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _emailStreamController.close();
    _areAllInputsValidStreamController.close();
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold(
        (failure) => {
              inputState.add(ErrorState(
                  StateRendererType.popupErrorState, failure.message))
            },
        (supportMessage) {
          inputState.add(SuccessState(supportMessage));
        });
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  Stream<bool> get outputAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((isaAllInputValid) => _isaAllInputValid());

  _isaAllInputValid() {
    return isEmailValid(email);
  }

  _validate() {
    inputAreAllInputsValid.add(null);
  }
}

abstract class ForgotPasswordViewModelInput {
  setEmail(String email);

  forgotPassword();

  Sink get inputEmail;

  Sink get inputAreAllInputsValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputAreAllInputsValid;
}
