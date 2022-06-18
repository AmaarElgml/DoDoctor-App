import 'package:booking_calendar/booking_calendar.dart';
import 'package:doctor_app/presentation/booking/view/widgets/loading_view.dart';
import 'package:doctor_app/presentation/resources/color_manager.dart';
import 'package:doctor_app/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer_impl.dart';
import '../viewmodel/booking_viewmodel.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  final BookingViewModel _viewModel = instance<BookingViewModel>();

  _bind() {
    _viewModel.start();
  }

  late BookingService bookingService;

  @override
  void initState() {
    _bind();
    bookingService = BookingService(
        serviceName: AppStrings.doctorName.tr(),
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
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
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.bookAppointment.tr())),
      body: BookingCalendar(
        getBookingStream: getBookingStream,
        uploadBooking: _viewModel.booking,
        convertStreamResultToDateTimeRanges: convertStreamResult,
        bookingService: bookingService,
        bookingButtonColor: ColorManager.primary,
        bookingButtonText: AppStrings.bookNow.tr(),
        loadingWidget: const LoadingView(),
      ),
    );
  }

  final now = DateTime.now();

  List<DateTimeRange> convertStreamResult({required dynamic streamResult}) {
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    _viewModel.converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    _viewModel.converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    _viewModel.converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    _viewModel.converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return _viewModel.converted;
  }

  Stream<dynamic>? getBookingStream(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }
}
