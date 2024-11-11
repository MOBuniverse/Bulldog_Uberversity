import 'package:bulldog_uberversity/models/food.dart';

class CartItem {
  Food food;
  List<AddOn> selectedAddOns;
  int  quantity;

  CartItem({
    required this.food,    
    required this.selectedAddOns,
    this.quantity = 1,
  });

  double get totalPrice{
    double addOnsPrice = selectedAddOns.fold(0, (sum, addOn) => sum + addOn.price);
    return (food.price + addOnsPrice) * quantity;
  }
}