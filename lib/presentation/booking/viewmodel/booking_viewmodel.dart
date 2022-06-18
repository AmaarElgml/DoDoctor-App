import 'dart:async';
import 'package:doctor_app/app/constants.dart';
import 'package:flutter/material.dart';
import '../../../domain/usecase/booking_usecase.dart';
import '../../base/base_viewmodel.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import 'package:booking_calendar/booking_calendar.dart';

final now = DateTime.now();

class BookingViewModel extends BaseViewModel
    with BookingViewModelInput, BookingViewModelOutput {
  final StreamController<BookingService> _bookingServicesController =
      StreamController<BookingService>.broadcast();

  final BookingUseCase _bookingUseCase;

  BookingViewModel(this._bookingUseCase);

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _bookingServicesController.close();
  }

  @override
  Sink get inputBookingService => _bookingServicesController.sink;

  @override
  Stream<BookingService> get outputBookingService =>
      _bookingServicesController.stream;

  List<DateTimeRange> converted = [];

  @override
  Future booking({required BookingService newBooking}) async {
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _bookingUseCase.execute(BookingUseCaseInput(
            1,
            Constants.fixedDayForFakeAPI,
            '${newBooking.bookingStart.hour}:${newBooking.bookingStart.minute}',
            '${newBooking.bookingEnd.hour}:${newBooking.bookingEnd.minute}',
            "Waiting")))
        .fold(
            (failure) => {
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (supportMessage) {
      inputState.add(SuccessState(supportMessage));
    });
  }
}

abstract class BookingViewModelInput {
  Future<dynamic> booking({required BookingService newBooking});

  Sink get inputBookingService;
}

abstract class BookingViewModelOutput {
  Stream<BookingService> get outputBookingService;
}
