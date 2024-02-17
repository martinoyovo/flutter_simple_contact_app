import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_contact_app/constants/app_colors.dart';
import 'package:simple_contact_app/constants/app_dimens.dart';
import 'package:simple_contact_app/constants/app_styles.dart';


class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value) onChanged;
  final String hint;
  final Widget? prefixIcon;
  final int? maxLines;
  final List<String> autofillHints;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final double? radius;
  final List<TextInputFormatter>? inputFormatters;

  const DefaultTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.hint,
    this.validator,
    this.maxLines,
    this.prefixIcon,
    this.autofillHints = const <String>[],
    this.keyboardType,
    this.inputFormatters,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? AppDimens.margin1),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: AppStyles.textFieldInputStyle,
        autofillHints: autofillHints,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines ?? 1,
        validator: validator?.call,
        cursorColor: AppColors.primary,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          fillColor: AppColors.neutral100,
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          hintText: hint,
          hintStyle: AppStyles.textFieldHintStyle,
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.all(AppDimens.margin2),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}