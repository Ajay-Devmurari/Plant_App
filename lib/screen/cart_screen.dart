import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_app/provider/cart_provider.dart';

import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CartProvider>(
        builder: (context, plantProvider, child) {
          final cartItem = plantProvider.cartItems;
          if (cartItem.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/no_data_found.json',
                    width: 200,
                    height: 200,
                    repeat: true,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    "Nothing here yet!",
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final plant = plantProvider.cartItems[index];
                    return ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          plantProvider.removeItem(plant);
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[800],
                        child: Image.asset(plant.imageURL, fit: BoxFit.contain),
                      ),
                      title: Text(plant.plantName),
                      subtitle: Text('\$${plant.price}'),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: plantProvider.cartItems.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
