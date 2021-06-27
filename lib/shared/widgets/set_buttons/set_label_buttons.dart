import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/divider/divider_widget.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOntap;
  final String secondaryLabel;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  final VoidCallback secondaryOntap;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOntap,
      required this.secondaryLabel,
      required this.secondaryOntap,
      this.enablePrimaryColor = false,
      this.enableSecondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.background,
        height: 56,
        child: Column(
          children: [
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            ),
            Container(
              height: 54,
              child: Row(
                children: [
                  Expanded(
                      child: LabelButton(
                    label: primaryLabel,
                    ontap: primaryOntap,
                    style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                  )),
                  DividerVertical(),
                  Expanded(
                      child: LabelButton(
                    label: secondaryLabel,
                    ontap: secondaryOntap,
                    style:
                        enableSecondaryColor ? TextStyles.buttonPrimary : null,
                  )),
                ],
              ),
            ),
          ],
        ));
  }
}
