import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../domain/model/auth_models.dart';
import '../../../resources/values_manager.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this.sliderObject, {Key? key}) : super(key: key);

  final SliderObject sliderObject;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p46, vertical: AppPadding.p60),
                child: Lottie.asset(sliderObject.image)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p46),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(sliderObject.title,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.left))),
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p46, vertical: AppPadding.p12),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(sliderObject.subTitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                        textAlign: TextAlign.left)))
          ],
        ),
      ),
    );
  }
}
