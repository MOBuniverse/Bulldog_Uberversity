import 'package:bulldog_uberversity/components/my_button.dart';
import 'package:bulldog_uberversity/models/food.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FoodDetailScreen extends StatefulWidget{
  final Food food;
  final Map<AddOn, bool > selectedAddOns = {};

   FoodDetailScreen({
    super.key, 
    required this.food,
    })
    {
      // Initialize seleced addons to be false
      for(AddOn addOn in food.availableAddOns){
        selectedAddOns[addOn] = false;
      }
    }

  @override
  State<FoodDetailScreen> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetailScreen>{
 

 // method to add to cart
 void addToCart(Food food, Map<AddOn, bool> selectedAddOns){

  // close the current food screen to go back to menu
  Navigator.pop(context);

  // format the selected addons
  List<AddOn> currentlySelectedAddOns = [];
  for (AddOn addOn in widget.food.availableAddOns) {
    if(widget.selectedAddOns[addOn] == true){
      currentlySelectedAddOns.add(addOn);
    }
  }

  // add to cart
  context.read<Restaurant>().addToCart(food, currentlySelectedAddOns);
 }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scaffold UI
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // F O O D   I M A G E
            Image.asset(
              widget.food.imagePath,
              width: double.infinity,
              height: 380,
              fit: BoxFit.cover,
              ),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: [
        
                // F O O D    N A M E
              Text(
                widget.food.name, 
                style: const TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 20,
                  ),
                ),
        

                // F O O D    P R I C E
                Text(
                '\$${widget.food.formattedPrice}',
                style: TextStyle( 
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
              
        
              const SizedBox(height: 10,),
        
              // F O O D description
              Text(widget.food.description),
        
              const SizedBox(height: 10),
        
              Divider(color: Theme.of(context).colorScheme.secondary,),
        
              const SizedBox(height: 10),
                        
              // A D D O N S
              Text(
                "Add-ons", 
                style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                ),
              ),
        
              const SizedBox(height: 10),
        
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onPrimary),
                    borderRadius: BorderRadius.circular(8),
                  ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.food.availableAddOns.length,
                  itemBuilder: (context, index) {

                    // get individual addons
                    AddOn addOn = widget.food.availableAddOns[index];
                
                    //  RETURN CHECKBOX UI
                    return CheckboxListTile(
                      title: Text(addOn.name),
                      subtitle: Text(
                        '\$${addOn.formattedPrice}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      value: widget.selectedAddOns[addOn], 
                      onChanged: (bool? value){
                        setState(() {
                          widget.selectedAddOns[addOn] = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 5,),
             ],
            ),
          ),
      
            // button -> add to cart
            MyButton(
              text: "Add to cart", 
              onTap: () => addToCart(widget.food, widget.selectedAddOns),
              ),

              const SizedBox(height: 25,),


              ],
            ),
          ),
        ),  
        
        // Back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              decoration: 
                BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  shape: BoxShape.circle,
                ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded,),color: Theme.of(context).colorScheme.surface,
                onPressed: () => Navigator.pop(context),
                ),
            
            ),
          ),
        )
      ],
    );
  }
}