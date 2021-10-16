import 'package:contacts/main.dart';

var list = List<Contact>.generate(
  20,
  (index) => Contact(
      image:
          'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg',
      name: 'Noaman Monther',
      number: '0780xxxxxxx',
      date: '2021/10/1',
      isIncome: index.isEven ? true : false),
);
