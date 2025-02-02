class Plant {
  String image;
  String name;
  String price;

  Plant({required this.image, required this.name, required this.price});
}

List<Plant> plants=[
  Plant(
    image: 'assets/plant (1).png',
    name: 'Samantha',
    price: '\$${40}',
  ),
  Plant(
    image: 'assets/plant (2).png',
    name: 'Angelica',
    price: '\$${25}',
  ),
  Plant(
    image: 'assets/plant (3).png',
    name: 'Samantha',
    price: '\$${67}',
  ),
  Plant(
    image: 'assets/plant (4).png',
    name: 'Angelica',
    price: '\$${15}',
  ),
  Plant(
    image: 'assets/plant (5).png',
    name: 'Samantha',
    price: '\$${55}',
  ),
];