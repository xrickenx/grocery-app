// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocerystore/components/grocery_item_tile.dart';
import 'package:grocerystore/model/cart_model.dart';
import 'package:grocerystore/pages/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) {
              return CartPage();
            }
          )
        ),
        backgroundColor: Colors.black,
        child: Icon(
          Icons.shopping_bag, 
          color: Colors.white,)
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 48),
          
          // good morning
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
            child: Text("Good morning,"),
          ),
          const SizedBox(height: 4),

          // Let's order fresh item for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),  
            child: Text(
              "Let's order fresh items for you",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              
              ),
          ),

          const SizedBox(height: 24,),

          // divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          
          const SizedBox(height: 24),

          // fresh items + grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Fresh Items",
              style: TextStyle(
                fontSize: 16,
              ),
              ),
          ),

          Expanded(
            child: Consumer<CartModel>(builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                  ),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopItems[index][0], 
                    itemPrice: value.shopItems[index][1], 
                    imagePath: value.shopItems[index][2], 
                    color: value.shopItems[index][3],
                    onPressed: () {
                      Provider.of<CartModel>(context, listen: false)
                          .addItemToCart(index);
                    },
                    );

                },
                );
            },)
            
            
          )


      ],),
    );
  }
}

