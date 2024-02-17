import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_contact_app/constants/app_colors.dart';
import 'package:simple_contact_app/constants/app_dimens.dart';
import 'package:simple_contact_app/constants/app_styles.dart';
import 'package:simple_contact_app/models/contact.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final Function() onTap;
  const ContactCard({
    super.key,
    required this.contact,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: AppDimens.avatarSize,
        width: AppDimens.avatarSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.neutral200
        ),
        child: Center(
          child: Text(
            contact.firstname == null ? "" : contact.firstname![0],
            style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.w500),
          )
        ),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_right_circle_fill,
        color: AppColors.neutral200,
        size: AppDimens.miniIconSize,
      ),
      title: Text(contact.firstname.toString(),
        style: AppStyles.cardTitleStyle,
      ),
    );
  }
}
