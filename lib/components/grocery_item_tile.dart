// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {

  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(24),
          ),
          
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          // image
          Image.asset(
            imagePath,
            height: 64,
            ),
          // item name
          Text(itemName),

          // price + btn
          MaterialButton(
            onPressed: onPressed,
            color: color[800],
            child: Text(
              "Rm " + itemPrice,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                ),
            )

          )

        ],)
      ),
    );
  }
}