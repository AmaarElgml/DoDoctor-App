import 'package:doctor_app/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import '../../app/app_prefs.dart';
import '../../app/constants.dart';
import '../../app/di.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: Constants.splashDelay), _goNext);
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) {
      isUserLoggedIn
          ? Navigator.pushNamedAndRemoveUntil(
              context, Routes.mainRoute, (route) => false)
          : _appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) => {
                    isOnBoardingScreenViewed
                        ? Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginRoute, (route) => false)
                        : Navigator.pushNamedAndRemoveUntil(
                            context, Routes.onBoardingRoute, (route) => false)
                  });
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primary,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.primary,
              statusBarBrightness: Brightness.dark),
        ),
        backgroundColor: ColorManager.primary,
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
                image: const AssetImage(ImageAssets.appLogo),
                color: ColorManager.white),
            const SizedBox(height: AppSize.s20),
            Text(AppStrings.doDoctor.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: ColorManager.white))
          ],
        )));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
