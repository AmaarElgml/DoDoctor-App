import 'package:doctor_app/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../domain/model/main_models.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard(this.appointment, {Key? key}) : super(key: key);

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    AppointmentData currentData = getButtonData();
    return Card(
        color: currentData.bgColor,
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m8),
        shape: defaultCardShape,
        child: Column(children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppStrings.bookingInformation.tr(),
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: AppSize.s1_5),
                        Text(
                            '${appointment.date} ${AppStrings.from.tr()}: ${appointment.start} ${AppStrings.to.tr()}: ${appointment.end}',
                            style: Theme.of(context).textTheme.titleSmall)
                      ]),
                  SvgPicture.asset(ImageAssets.rightArrowSettingsIc,
                      color: ColorManager.lightGrey),
                ],
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: Row(children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(currentData.text),
                    style:
                        ElevatedButton.styleFrom(primary: currentData.color)),
              )
            ]),
          )
        ]));
  }

  AppointmentData getButtonData() {
    switch (appointment.status) {
      case 'Waiting':
        return AppointmentData(AppStrings.cancelAppointment.tr(),
            ColorManager.error2, ColorManager.lightBlueGrey);
      default:
        return AppointmentData(AppStrings.leaveFeedback.tr(),
            ColorManager.lightGrey.withOpacity(0.7), ColorManager.white);
    }
  }
}

class AppointmentData {
  final String text;
  final Color color;
  final Color bgColor;

  AppointmentData(this.text, this.color, this.bgColor);
}
