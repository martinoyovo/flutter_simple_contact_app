import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_contact_app/constants/app_colors.dart';
import 'package:simple_contact_app/constants/app_dimens.dart';
import 'package:simple_contact_app/view_models/contact_view_model.dart';
import 'package:simple_contact_app/widgets/add_contact_form.dart';
import 'package:simple_contact_app/widgets/contact_card.dart';
import 'package:simple_contact_app/widgets/default_text_field.dart';
import 'package:simple_contact_app/widgets/dialog_helper.dart';
import 'package:stacked/stacked.dart';

class ContactList extends StatelessWidget {
  static const String screenName = 'contactList';

  ContactList({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ContactViewModel>.reactive(
      viewModelBuilder: () => ContactViewModel(),
      builder: (context, viewModel, _) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Contacts', style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: Builder(
          builder: (_) {
            if (viewModel.contacts.isEmpty) {
              return const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.phone_down_circle_fill, size: AppDimens.iconSize),
                    Gap(AppDimens.margin2),
                    Text('No contact yet. Click + to add a new one.'),
                  ],
                ),
              );
            }
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.margin2),
                  child: DefaultTextField(
                    controller: searchController,
                    onChanged: viewModel.searchContact,
                    hint: viewModel.hintSearch,
                      radius: 75
                  ),
                ),
                const Gap(AppDimens.margin2_5),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: AppDimens.margin2),
                    itemCount: viewModel.filteredContacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      final contact = viewModel.filteredContacts[index];
                      return ContactCard(
                        contact: contact,
                        onTap:() {
                          viewModel.setContact(contact);
                          context.push('/contact');
                        }
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(AppDimens.margin3);
                    },
                  ),
                ),
              ],
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary,
          onPressed: () {
            DialogHelper().showBottomSheet(
              context: context,
              child: const AddContactForm()
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

