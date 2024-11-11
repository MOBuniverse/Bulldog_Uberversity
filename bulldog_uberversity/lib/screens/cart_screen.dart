import 'package:bulldog_uberversity/components/my_button.dart';
import 'package:bulldog_uberversity/components/my_cart_tile.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:bulldog_uberversity/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder:(context, restaurant, child){
      // cart
      final userCart = restaurant.cart;

      // scaffold UI
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Clear Cart?"),
                    actions: [

                      // Cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom( foregroundColor: const Color.fromARGB(255, 108, 181, 210),),
                        child: const Text("Cancel"), 
                        ),

                      // Yes button
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                         style: TextButton.styleFrom( foregroundColor: const Color.fromARGB(255, 108, 181, 210),),

                        child: const Text("Yes"),
                        ),
                    ],
                  ),
                );
              } ,
              icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [

              // List of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty ? Expanded(
                      child: Center(
                        child: const Text("Cart is empty..."),
                        ),
                    ):
                    Expanded(child: ListView.builder(
                      itemCount: userCart.length, 
                      itemBuilder: (context, index) {
                
                        // get individual cart item
                        final cartItem = userCart[index];
                
                        // return cart tile UI
                        return MyCartTile(cartItem: cartItem);
                        }, 
                      ),
                    ),
                  ],
                ),
              ),

              // button to pay
              MyButton(
                text: "Checkout", 
                onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => const PaymentScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 40,),


            ],
          ),
        );
      },
    );
  }
}