import 'package:flutter/material.dart';

import '../../../../../../domain/model/main_models.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/values_manager.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(this.banner, {Key? key}) : super(key: key);
  final BannerAd banner;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12),
            side: BorderSide(color: ColorManager.primary, width: AppSize.s1)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSize.s12),
          child: Image.network(banner.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
