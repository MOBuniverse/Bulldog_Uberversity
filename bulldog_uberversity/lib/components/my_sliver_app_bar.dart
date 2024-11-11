import 'package:bulldog_uberversity/screens/cart_screen.dart';
import 'package:flutter/material.dart';


class MySliverAppBar extends StatelessWidget{
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // shopping cart
        IconButton(
          onPressed: () {
            // go to cart screen
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
                ),
              );
          },
           icon: const Icon(Icons.shopping_bag),
           ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("M.A.D Dog Diner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}