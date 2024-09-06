// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:grocerystore/model/cart_model.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: Consumer<CartModel>(
        builder: (context, value, child){
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cartItems.length,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        leading: Image.asset(value.cartItems[index][2],
                        height: 25,
                        ),
                        title: Text(value.cartItems[index][0]),
                        subtitle: Text("Rm " + value.cartItems[index][1]),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () => Provider.of<CartModel>(context, listen: false)
                            .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),

            // total + pay now
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green,
                borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(24),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text(
                        "Total Price:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                      Text(
                        "Rm " + value.calculateTotal(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],),

                    // pay now btn
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.green.shade100,
                          ),

                        borderRadius: BorderRadius.circular(12)
                        
                        ),
                      padding: EdgeInsets.all(12),
                      
                      child: Row(
                        children: [
                          const Text(
                            "Pay now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            ),

                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Colors.white,
                          )
                        ],
                      ),

                    )
                    
                  ],
                )
              ),
            ),


          ],
        );
      },
      )

    );
  }
}