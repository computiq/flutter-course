import 'package:flutter/material.dart';
import 'contacts_data.dart';
import 'contact_card.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: contacts_data
          .map((recData) => ContactCard(
                image: recData.image,
                name: recData.name,
                mobileNumber: recData.mobileNumber,
              ))
          .toList(),
    );
  }
}
