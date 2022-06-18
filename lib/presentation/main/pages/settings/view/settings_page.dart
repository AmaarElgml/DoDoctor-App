import 'package:doctor_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:math' as math;

import '../../../../../app/app_prefs.dart';
import '../../../../../app/di.dart';
import '../../../../../data/data_source/local_data_source.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/language_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/values_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            leading: Icon(Icons.help, color: ColorManager.primary),
            title: Text(AppStrings.aboutDoctor.tr(),
                style: Theme.of(context).textTheme.titleSmall),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  context.locale == ARABIC_LOCAL ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              _aboutDoctor(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.language, color: ColorManager.primary),
            title: Text(AppStrings.changeLanguage.tr(),
                style: Theme.of(context).textTheme.titleSmall),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  context.locale == ARABIC_LOCAL ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              _changeLanguage(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.call, color: ColorManager.primary),
            title: Text(AppStrings.contactUs.tr(),
                style: Theme.of(context).textTheme.titleSmall),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  context.locale == ARABIC_LOCAL ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              _contactUs(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.share, color: ColorManager.primary),
            title: Text(AppStrings.inviteYourFriends.tr(),
                style: Theme.of(context).textTheme.titleSmall),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  context.locale == ARABIC_LOCAL ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              _inviteFriends();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: ColorManager.primary),
            title: Text(AppStrings.logout.tr(),
                style: Theme.of(context).textTheme.titleSmall),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                  context.locale == ARABIC_LOCAL ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              _logout(context);
            },
          )
        ],
      ),
    );
  }

  _aboutDoctor(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.doctorInformationRoute);
  }

  _changeLanguage(BuildContext context) {
    _appPreferences.changeAppLanguage();
    Phoenix.rebirth(context);
  }

  _contactUs(BuildContext context) {
    Navigator.pushNamed(context, Routes.contactUSRoute);
  }

  _inviteFriends() {
    Share.share(AppStrings.shareMessage.tr());
  }

  _logout(BuildContext context) {
    _appPreferences.logout();
    _localDataSource.clearCache();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
