class Food{
  final String name;           // Cheese burger
  final String description;    // A burger with cheese
  final String imagePath;      // lib/images/cheese_burger.png
  final double price;          // 4.99
  final FoodCategory category; // Burger
  List<AddOn> availableAddOns; // [ extra cheese, sauce, toppings]

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddOns,
  });

    String get formattedPrice => price.toStringAsFixed(2);

}




// Food categories
enum FoodCategory{
  // ignore: constant_identifier_names
  Burgers,
  // ignore: constant_identifier_names
  Salads,
  // ignore: constant_identifier_names
  Sides,
  // ignore: constant_identifier_names
  Desserts,
  // ignore: constant_identifier_names
  Drinks,
}

// Food add-ons
class AddOn{
  String name;
  double price;

  AddOn({
    required this.name,
    required this.price,
  });

  String get formattedPrice => price.toStringAsFixed(2);
}