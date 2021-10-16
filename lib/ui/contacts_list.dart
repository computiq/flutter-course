

import 'package:flutter/material.dart';

import '../data.dart';
import 'contact_item_view.dart';

Widget buildContactsList() {
  return ListView.builder(
    itemBuilder: (_context, index) {
      return buildContactItem(contacts[index]);
    },
    itemCount: contacts.length,
  );
}
