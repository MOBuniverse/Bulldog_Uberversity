import 'package:bulldog_uberversity/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';


class Restaurant extends ChangeNotifier {

// List of food item
final List<Food> _menu = [
  // Burgers
  Food(
    name: "Classsic American Burger", 
    description: "Two beef patties with melted American cheese, lettuce, onions, tomatoes, pickles, and topped with our house made sauce. ", 
    imagePath: "lib/Images/Burger/American_Burger.png", 
    price: 4.75, 
    category: FoodCategory.Burgers, 
    availableAddOns: [
      AddOn(name: "Extra cheese", price: 0.20),
      AddOn(name: "Bacon", price: 1.00),
      AddOn(name: "Extra patty", price: 1.35),
    ],
  ),
  Food(
    name: "Big Bacon Burger", 
    description: "A thick beef patty with melted American cheese, onions, tomatoes, pickles, and 4 stips of crispy bacon. ", 
    imagePath: "lib/Images/Burger/Bacon_Burger.png", 
    price: 6.54, 
    category: FoodCategory.Burgers, 
    availableAddOns: [
      AddOn(name: "Extra cheese", price: 0.20),
      AddOn(name: "Extra bacon", price: 1.00),
    ],
  ),
  Food(
    name: "Vegan Advacodo Burger", 
    description: "Plant-based patty with vegan cheese, lettuce, advacado spread, tomatoes, pickles, and red peppers. ", 
    imagePath: "lib/Images/Burger/Vegan_Advacado_Burger.png", 
    price: 5.76, 
    category: FoodCategory.Burgers, 
    availableAddOns: [
      AddOn(name: "Extra cheese", price: 0.20),
      AddOn(name: "Bacon", price: 1.00),
      AddOn(name: "Extra patty", price: 1.35),
    ],
  ),
  Food(
    name: "Vegan Burger Sliders", 
    description: "Two blackbean Burger sliders with lettuce, tomatoes, and mayo between gluten-free buns. ", 
    imagePath: "lib/Images/Burger/Vegan_Burger.png", 
    price: 4.85, 
    category: FoodCategory.Burgers, 
    availableAddOns: [
      AddOn(name: "Cheese", price: 0.20),
      AddOn(name: "Bacon", price: 1.00),
      AddOn(name: "Extra patty", price: 1.35),
    ],
  ),



  // Salads
  Food(
    name: "All in Salad", 
    description: "Everything a salad needs and more. Leafy greens, carrots, tomatoes, raddishes, cucumbers, and advacados. Served with side of ranch dressing. ", 
    imagePath: "lib/Images/Salads/All_in_salad.png", 
    price: 5.79, 
    category: FoodCategory.Salads, 
    availableAddOns: [
      AddOn(name: "Shredded cheese", price: 0.20),
      AddOn(name: "Bacon bits", price: 0.50),
      AddOn(name: "Extra ranch", price: 0.30),
      AddOn(name: "Extra cucumbers", price: 0.30),
      AddOn(name: "Extra advacados", price: 1.00),
    ],
  ),
  Food(
    name: "Fruit Salad", 
    description: "Leafy greens, cooked shrimp, watermelon, feta cheese, and blueberries. Served with a side of raspberry vinaigrette. ", 
    imagePath: "lib/Images/Salads/Fruit_salad.png", 
    price: 4.31, 
    category: FoodCategory.Salads, 
    availableAddOns: [
      AddOn(name: "Extra feta cheese", price: 0.20),
      AddOn(name: "Extra shrimp", price: 1.10),
      AddOn(name: "Extra raspberry vinaigrette", price: 0.80),
      AddOn(name: "Bacon bits", price: 0.50),
      AddOn(name: "Extra watermelon", price: 1.00),
      AddOn(name: "Extra blueberries", price: 0.45),
    ],
  ),
  Food(
    name: "Better Basic Salad", 
    description: "Leafy greens, crutons, and tomatoes topped with shredded white cheddar cheese. Served with a side of ranch dressing. ", 
    imagePath: "lib/Images/Salads/Regular_Salad.png", 
    price: 3.99, 
    category: FoodCategory.Salads, 
    availableAddOns: [
      AddOn(name: "Extra shredded cheese", price: 0.20),
      AddOn(name: "Bacon bits", price: 0.50),
      AddOn(name: "Extra tomatoes", price: 0.30),
      AddOn(name: "Extra crutons", price: 0.30),
      AddOn(name: "Extra ranch", price: 1.00),
    ],
  ),
  

  // Desserts
  Food(
    name: "Giant Cinnamonroll", 
    description: "4 inch cinnamonroll topped with melted cream cheese frosting served warm.", 
    imagePath: "lib/Images/Desserts/Cinnamonroll.png", 
    price: 3.00, 
    category: FoodCategory.Desserts, 
    availableAddOns: [
      AddOn(name: "Extra cream cheese frosting (on side)", price: 0.50),
    ],
  ),
  Food(
    name: "Double Choco Muffin ", 
    description: "Jumbo sized chocolate muffin with milk chocolate chips served warm. ", 
    imagePath: "lib/Images/Desserts/Double_chocolate_muffin.png", 
    price: 2.00, 
    category: FoodCategory.Desserts, 
    availableAddOns: [
      AddOn(name: "Cream cheese frosting (on side)", price: 0.50),
    ],
  ),
  Food(
    name: "Strawberry Filled Chocolate Doughnut ", 
    description: "Chocolate doughnut filled with strawberry jam and frosted with a strawberry glaze. ", 
    imagePath: "lib/Images/Desserts/Strawberry_Frosted_doughnut.png", 
    price: 2.15, 
    category: FoodCategory.Desserts, 
    availableAddOns: [
      AddOn(name: "Extra strawberry glaze (on side)", price: 0.20),
    ],
  ),



  // Drinks
  Food(
    name: "Grapefruit Lemon-Limeaide ", 
    description: "Refreshing cold juice drink made with juiced grapefruit and a lemon-lime mix. ", 
    imagePath: "lib/Images/Drinks/Grapefruit_lemonaid.png", 
    price: 2.15, 
    category: FoodCategory.Drinks, 
    availableAddOns: [
      AddOn(name: "Remove ice", price: 0.00),
    ],
  ),
  Food(
    name: "Lemonaide", 
    description: "Refreshing cold lemonaide made from fresh lemons. ", 
    imagePath: "lib/Images/Drinks/Lemonaid.png", 
    price: 2.54, 
    category: FoodCategory.Drinks, 
    availableAddOns: [
      AddOn(name: "Remove ice", price: 0.00),
    ],
  ),
  Food(
    name: "Like Sprite ", 
    description: "Refreshing cold flavored sparkling water with added juiced lemons and limes. ", 
    imagePath: "lib/Images/Drinks/Limeaid_soda.png", 
    price: 2.11, 
    category: FoodCategory.Drinks, 
    availableAddOns: [
      AddOn(name: "Remove ice", price: 0.00),
      AddOn(name: "Add cherry flavoring", price: 0.20),
    ],
  ),
  Food(
    name: "Classic OJ", 
    description: "Refreshing cold orange juice made from fresh oranges. ", 
    imagePath: "lib/Images/Drinks/Orangejuice.png", 
    price: 2.15, 
    category: FoodCategory.Drinks, 
    availableAddOns: [
      AddOn(name: "Remove ice", price: 0.00),
      AddOn(name: "Make it a mimosa", price: 1.00),
    ],
  ),



  // Sides
  Food(
    name: "House Fries", 
    description: "Basket of fries made to order topped with salt, pepper, and garnish. Served with a side of ketchup.", 
    imagePath: "lib/Images/Sides/House_fries.png", 
    price: 2.52, 
    category: FoodCategory.Sides, 
    availableAddOns: [
      AddOn(name: "Extra ketchup", price: 0.20),
    ],
  ),
  Food(
    name: "Onion Rings", 
    description: "Basket of beer battered onion rings made to order served with a side of ketchup.", 
    imagePath: "lib/Images/Sides/Onion_rings.png", 
    price: 2.65, 
    category: FoodCategory.Sides, 
    availableAddOns: [
      AddOn(name: "Extra ketchup", price: 0.20),
    ],
  ),
  Food(
    name: "Hot Wings", 
    description: "Basket of hot sauced fried wings made to order served with a side of ranch.", 
    imagePath: "lib/Images/Sides/Wings.png", 
    price: 2.75, 
    category: FoodCategory.Sides, 
    availableAddOns: [
      AddOn(name: "Extra ranch", price: 0.20),
      ],
    ),
  ];

// user cart
 final List<CartItem> _cart = [];

 // Delivery Address
 String _deliveryAddress = '99 Hollywood Blv';

  /*

  G E T T E R S
    
  */ 
  List<Food> get menu => _menu; // menu getter
  List<CartItem> get cart => _cart; // cart getter
  String get deliveryAddress => _deliveryAddress; // delivery address getter






  /*

  O P E R A T I O N S

  */ 

  

  // add to cart
  void addToCart(Food food, List<AddOn> selectedAddOns){
    // Check if there is a cart item already w/ the same food and selected addons 
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons asre the same
      bool isSameAddons = 
      ListEquality().equals(
        item.selectedAddOns, 
        selectedAddOns);
      return isSameFood && isSameAddons;
    });

    // if item already exists, increase it's quantity
    if (cartItem != null){
      cartItem.quantity++;
    }

    // Otherwise add new item to cart
    else{
      _cart.add(
        CartItem(
          food: food, 
          selectedAddOns: selectedAddOns,
        ),
      );
    }
    notifyListeners();
  }


  // remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1){
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }
      else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }


  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for (AddOn addOn in cartItem.selectedAddOns){
        itemTotal += addOn.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }


  //  Update delivery address 
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  /*

  H E L P E R S

  */ 

  // generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.writeln( "Here's your receipt:");
    receipt.writeln();

    // format the date to include up to secomds only 
    String formattedDate = 
    DateFormat('MM/dd/yyyy HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddOns.isNotEmpty){
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();

  }


  // format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }


  // format list of addons into string summary
  String _formatAddons(List<AddOn> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
    .join(", ");
  }


}