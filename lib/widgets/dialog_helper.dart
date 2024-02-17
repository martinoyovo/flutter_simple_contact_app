import 'package:flutter/material.dart';
import 'package:simple_contact_app/constants/app_colors.dart';
import 'package:simple_contact_app/constants/app_dimens.dart';

class DialogHelper {
  Future<void> showBottomSheet({
    bool? isDismissible,
    required BuildContext context,
    required Widget child}) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius3),
          topRight: Radius.circular(AppDimens.radius3)
        )
      ),
      backgroundColor: AppColors.neutral0,
      builder: (_) {
        return Wrap(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(
                AppDimens.margin2,
                AppDimens.margin2,
                AppDimens.margin2,
                AppDimens.margin3
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: child
              )
            ),
          ],
        );
      }
    );
  }
}