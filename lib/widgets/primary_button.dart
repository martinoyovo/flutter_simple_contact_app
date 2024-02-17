import 'package:flutter/material.dart';
import 'package:simple_contact_app/constants/app_dimens.dart';
import 'package:simple_contact_app/constants/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: AppStyles.primaryButtonStyle,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.margin2),
        child: Text(label, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}
