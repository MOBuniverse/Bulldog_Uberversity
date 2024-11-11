import 'package:bulldog_uberversity/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'delivery_progress_screen.dart';

class PaymentScreen extends StatefulWidget{
  const PaymentScreen({super.key});


  @override
  State<PaymentScreen> createState() => _PaymentScreen();
}

class _PaymentScreen extends State<PaymentScreen>{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  // User wants to pay 
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      // Only show dialog if form is valid
      showDialog(
        context: context,
       builder: (context) => AlertDialog(
        title: const Text("Confirm payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder Name: $cardHolderName"),
              Text("CVV: $cvvCode"),
            ],
          ),
        ),

        actions: [
          // cancel button
          TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 213, 76, 122)),
              child: const Text("Cancel"),
            ),


          // yes button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
              context,
            MaterialPageRoute(
                builder: (context) => DeliveryProgressScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 213, 76, 122)),
            child: const Text("Yes"),
          ),
        ],
       ),
       );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          // Credit Card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          // Credit Card Form
          CreditCardForm(
            cardNumber: cardNumber, 
            expiryDate: expiryDate, 
            cardHolderName: cardHolderName, 
            cvvCode: cvvCode, 
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            }, 
            formKey: formKey,
          ),

          const Spacer(),

          MyButton(
            text: "Pay now",
            onTap: userTappedPay
            ),

            const SizedBox(height: 35,),

        ],
      ),
    );
  }
}