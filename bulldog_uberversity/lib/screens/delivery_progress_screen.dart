import 'package:bulldog_uberversity/components/my_receipt.dart';
import 'package:bulldog_uberversity/models/restaurant.dart';
import 'package:bulldog_uberversity/services/database/firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProgressScreen extends StatefulWidget{
  const DeliveryProgressScreen({super.key});

  @override
  State<DeliveryProgressScreen> createState() => _DeliveryProgressScreenState();
}

class _DeliveryProgressScreenState extends State<DeliveryProgressScreen> {

  // Get access to DB
  FireStoreService db = FireStoreService();


  @override
  void initState() {
    super.initState();

    // If user gets to this page submit order to DB
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery in progress..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyReceipt(),
          ],
        ),
      ),
    );  
  }

  // Custom Bottom Nav Bar - Message / Call delivery driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.only(top: 25, left: 25, bottom: 40, right: 25),
      child: Row(
        children: [
          // Profile pic of driver 
          Container(decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface,
          shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.person),
            ),
          ),

          const SizedBox(width: 10,),

          // Driver details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lauren Keil",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [

              // message button
              Container(
                decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                    ),
                  child: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.message_rounded),
                    color: Theme.of(context).colorScheme.onSurface,
            ),
          ),

            const SizedBox(width: 10,),
            
              // call button
              Container(
                decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                    ),
                  child: IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.call),
                    color: Colors.lightBlue,
                ),
              ), 
            ],
          ),
        ],
      ),
    );
  }
}