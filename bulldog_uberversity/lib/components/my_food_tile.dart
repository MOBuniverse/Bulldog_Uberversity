import 'package:flutter/material.dart';

import '../models/food.dart';



class FoodTile extends StatelessWidget{
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key, 
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [        

                // text food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(food.name),
                  Text('\$${food.formattedPrice}',
                    style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  ),
                  const SizedBox(height: 10),
                  Text(food.description,
                    //overflow: TextOverflow.ellipsis,
                    style:TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),

                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath, 
                    width: 125,
                    height: 125,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),

        //divider line
         Divider(
          color: Theme.of(context).colorScheme.secondaryContainer,
          endIndent: 25,
          indent: 25,
        ),




      ],
    );
  }
}