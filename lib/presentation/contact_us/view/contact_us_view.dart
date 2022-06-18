import 'package:contactus/contactus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/background_cip.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.contactUs.tr())),
      body: Container(
        color: ColorManager.primary.withOpacity(0.25),
        child: Stack(
          children: [
            BackgroundCip(ColorManager.white),
            ContactUs(
              logo: const AssetImage(ImageAssets.devLogo),
              companyName: 'Ammar Elgml',
              tagLine: 'Flutter Developer',
              email: 'eng.ammarelgml@gmail.com',
              githubUserName: 'AmaarElgml',
              linkedinURL: 'https://www.linkedin.com/in/ammar-elgml-5a43381aa',
              dividerThickness: 2,
              companyColor: ColorManager.black,
              taglineColor: ColorManager.grey,
              textColor: ColorManager.black,
              cardColor: ColorManager.lightBlueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
