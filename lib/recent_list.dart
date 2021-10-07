import 'package:contacts_app/contact_obj.dart';
import 'package:flutter/material.dart';
import 'recent_card.dart';
import 'contacts_data.dart';

class RecentListView extends StatelessWidget {
  const RecentListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: contacts_data
          .map((recData) => ResentCard(
              image: recData.image,
              name: recData.name,
              mobileNumber: recData.mobileNumber,
              callDate: recData.callDate,
              isIncoming: recData.isIncoming))
          .toList(),
    );
  }
}
