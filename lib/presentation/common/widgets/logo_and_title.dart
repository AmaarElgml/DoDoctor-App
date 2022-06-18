import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class LogoAndTitle extends StatelessWidget {
  const LogoAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(ImageAssets.appLogo, fit: BoxFit.fill,
            color: ColorManager.primary.withOpacity(0.9), width: AppSize.s140),
        Text(
          AppStrings.doDoctor.tr(),
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: ColorManager.primary.withOpacity(0.9)),
        ),
      ],
    );
  }
}
