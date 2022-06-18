import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../resources/values_manager.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
            height: AppSize.s100,
            width: AppSize.s100,
            child: Lottie.asset(JsonAssets.loading)),
        Center(
            child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text('Loading',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: FontSize.s18),
                    textAlign: TextAlign.center)))
      ],
    );
  }
}
