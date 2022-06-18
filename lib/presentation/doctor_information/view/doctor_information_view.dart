import 'package:doctor_app/presentation/doctor_information/view/widgets/expandable_item.dart';
import 'package:doctor_app/presentation/doctor_information/view/widgets/review_item.dart';
import 'package:doctor_app/presentation/resources/strings_manager.dart';
import 'package:doctor_app/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class DoctorInformationView extends StatelessWidget {
  const DoctorInformationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.doctorName.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: ListView(
          children: [
            _doctorPhoto(),
            ExpandableItem(
                AppStrings.aboutDoctor.tr(), AppStrings.doctorAbout.tr()),
            ExpandableItem(
                AppStrings.specialization.tr(), AppStrings.doctorSpecialization.tr()),
            ExpandableItem(
                AppStrings.education.tr(), AppStrings.doctorEducation.tr()),
            ExpandableItem(
                AppStrings.certificates.tr(), AppStrings.doctorCertification.tr()),
            ExpandableItem(AppStrings.reviews.tr(), '',
                widget: _reviewsWidget(context)),
          ],
        ),
      ),
    );
  }

  Widget _doctorPhoto() {
    return CircleAvatar(
        radius: AppSize.s40, child: Image.asset(ImageAssets.doctorImage));
  }

  Widget _reviewsWidget(BuildContext context) {
    return Column(
      children: [
        ReviewItem(AppStrings.doctorReview1.tr(), 5),
        ReviewItem(AppStrings.doctorReview2.tr(), 4.7),
      ],
    );
  }
}
