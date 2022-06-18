import 'package:doctor_app/presentation/resources/color_manager.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../../app/constants.dart';
import '../../../resources/values_manager.dart';

class ExpandableItem extends StatelessWidget {
  const ExpandableItem(
    this.title,
    this.desc, {
    this.widget,
    Key? key,
  }) : super(key: key);

  final String title;
  final String desc;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p8),
      child: ExpandablePanel(
        theme: ExpandableThemeData(
          headerAlignment: ExpandablePanelHeaderAlignment.center,
          iconColor: ColorManager.primary,
          animationDuration: const Duration(milliseconds: Constants.expandedAnimationTime),
        ),
        header: Text(title, style: Theme.of(context).textTheme.headlineLarge),
        collapsed:
            Divider(height: 1, color: ColorManager.primary.withOpacity(0.5)),
        expanded: widget ?? Text(desc,
            style: Theme.of(context).textTheme.headlineMedium, softWrap: true),
      ),
    );
  }
}
// Patients’ Reviews :
