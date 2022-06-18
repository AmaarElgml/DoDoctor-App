import 'package:doctor_app/presentation/resources/color_manager.dart';
import 'package:doctor_app/presentation/resources/strings_manager.dart';
import 'package:doctor_app/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/onboarding.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../domain/model/auth_models.dart';
import '../../common/widgets/background_cip.dart';
import '../../resources/routes_manager.dart';
import '../viewmodel/on_boarding_viewmodel.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _bind() {
    _appPreferences.setOnBoardingScreenViewed();
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? data) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.lightBlueGrey,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: Stack(
        children: [
          BackgroundCip(ColorManager.lightBlueGrey),
          Onboarding(
            pages: _viewModel.onBoardingPagesList,
            onPageChange: (int pageIndex) {
              _viewModel.onPageChanged(pageIndex);
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p46),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.polygon(
                          polygonDesign: PolygonDesign(
                            polygon: DesignType.polygon_circle,
                          ),
                        ),
                        activeIndicator: ActiveIndicator(
                            color: ColorManager.primary, borderWidth: 2),
                      ),
                    ),
                    data?.currentIndex == 2
                        ? _getStartedButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget get _getStartedButton {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.loginRoute, (route) => false);
      },
      child: Text(AppStrings.getStarted.tr()),
    );
  }

  Widget _skipButton({void Function(int)? setIndex}) {
    return ElevatedButton(
      onPressed: () {
        if (setIndex != null) {
          _viewModel.onPageChanged(2);
          setIndex(2);
        }
      },
      child: Text(AppStrings.skip.tr()),
    );
  }
}
