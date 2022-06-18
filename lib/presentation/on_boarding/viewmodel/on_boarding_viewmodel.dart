import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:onboarding/onboarding.dart';
import '../../../domain/model/auth_models.dart';
import '../../base/base_viewmodel.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';
import '../view/widgets/on_boarding_page.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>.broadcast();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  final onBoardingPagesList = [
    PageModel(
        widget: OnBoardingPage(SliderObject(
            AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingSubTitle1.tr(),
            JsonAssets.onboarding1))),
    PageModel(
        widget: OnBoardingPage(SliderObject(
            AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingSubTitle2.tr(),
            JsonAssets.onboarding2))),
    PageModel(
        widget: OnBoardingPage(SliderObject(
            AppStrings.onBoardingTitle3.tr(),
            AppStrings.onBoardingSubTitle3.tr(),
            JsonAssets.onboarding3))),
  ];

  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1.tr(),
            AppStrings.onBoardingSubTitle1.tr(), ImageAssets.doctor1),
        SliderObject(AppStrings.onBoardingTitle2.tr(),
            AppStrings.onBoardingSubTitle2.tr(), ImageAssets.doctor2),
        SliderObject(AppStrings.onBoardingTitle3.tr(),
            AppStrings.onBoardingSubTitle3.tr(), ImageAssets.doctor3),
      ];
}

abstract class OnBoardingViewModelInputs {
  int goNext();

  int goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
