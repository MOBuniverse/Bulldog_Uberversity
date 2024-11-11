import 'package:bulldog_uberversity/components/my_quantity_selector.dart';
import 'package:bulldog_uberversity/models/cart_item.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget{
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
            
                const SizedBox(width: 10,),
                
            
                // Name and price
                 Expanded(
                   child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // food name
                        
                        Text(cartItem.food.name,),
                                
                        // food price
                        Text('\$${cartItem.food.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                        ),
                   
                        const SizedBox(height: 10,),
                   
                        // add and decrease Quantity
                        MyQuantitySelector(
                    quantity: cartItem.quantity, 
                    food: cartItem.food, 
                    onDecrement: () {
                      restaurant.removeFromCart(cartItem);
                    }, 
                    onIncrement: () {
                      restaurant.addToCart(cartItem.food, cartItem.selectedAddOns);
                    },
                                   ),
                      ],
                    ),
                 ),

               const Spacer(),
            
              ],
            ),
          ),

          // addons
          SizedBox(
            height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
              children: cartItem.selectedAddOns.map(
                (addOn) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Row(
                      children: [
                        // Addon Name
                        Text(addOn.name),
                  
                        // Addon Price
                        Text(' (\$${addOn.price}) '),
                      ],
                      ), 
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    onSelected: (value) {},
                    backgroundColor: 
                      Theme.of(context).colorScheme.surface,
                    labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 12),
                    ),
                ),
                )
                .toList(),
            ),
          )
          ],
        ), 
      ),
    );
  }
}