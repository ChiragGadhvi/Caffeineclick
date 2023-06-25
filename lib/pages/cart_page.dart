import 'package:caffeineclick/components/coffee_tile.dart';
import 'package:caffeineclick/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/coffee.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove items from cart
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemsFromCart(coffee);
  }

  // pay button tapped
  void payNow(){
    // fill your payment serivices
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    // heading
                    Text(
                      'Your Cart',
                      style: TextStyle(fontSize: 20),
                    ),

                     SizedBox(height: 25),


                    // list of cart items
                    Expanded(
                        child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                      // get individual cart items
                      Coffee eachCoffee = value.userCart[index];

                      // return coffee tile
                      return CoffeeTile(
                        coffee: eachCoffee,
                        onPressed: () => removeFromCart(eachCoffee),
                        icon: Icon(Icons.delete),
                      );
                    },),
                    ),

                    // pay button
                    GestureDetector(
                      onTap: payNow,
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.brown, borderRadius: BorderRadius.circular(12),),
                        child: const Center(
                          child: Text(
                            'Pay Now',
                            style: TextStyle(color: Colors.white),
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
