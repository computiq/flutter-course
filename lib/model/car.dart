class Car {
  String name;
  String image;
  int price;
  double rating;
  int deals;

  Car(
      {required this.image,
      required this.name,
      required this.price,
      required this.rating,
      required this.deals});
}

List<Car> cars = [
  Car(
      image: 'images/bmw_i8.png',
      name: 'BMW i8',
      price: 299,
      rating: 4.3,
      deals: 15),
  Car(
      image: 'images/lamborghini.png',
      name: 'Lamborghini Huracan',
      price: 599,
      rating: 4.8,
      deals: 27),
  Car(
      image: 'images/lamborghini2.png',
      name: 'Lamborghini Gallardo',
      price: 399,
      rating: 4.5,
      deals: 18),
];
