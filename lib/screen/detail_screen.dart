import 'package:flutter/material.dart';
import 'package:plant_app/model/plant_model.dart';
import 'package:plant_app/provider/favorite_provider.dart';
import 'package:plant_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final Plant plant;

  const DetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 80),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(plant.imageURL, fit: BoxFit.contain),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _PlantInfo(title: 'Size', value: plant.size),
                    const SizedBox(height: 12),
                    _PlantInfo(title: 'Temp', value: plant.temperature),
                    const SizedBox(height: 12),
                    _PlantInfo(title: 'Humidity', value: '${plant.humidity}%'),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBox(
                  Icons.close,
                  () => Navigator.pop(context),
                  Colors.green,
                  Colors.grey.withOpacity(0.5),
                ),
                Consumer<FavoriteProvider>(
                  builder: (context, favProvider, child) {
                    return _iconBox(
                      plant.isFavorite ? Icons.favorite : Icons.favorite_border,
                      () => favProvider.favItem(plant),
                      plant.isFavorite ? Colors.green : Colors.green,
                      Colors.grey.withOpacity(0.5),
                    );
                  },
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        plant.plantName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            plant.rating.toString(),
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                          const Icon(Icons.star, color: Colors.green, size: 18),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${plant.price}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    plant.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Consumer<CartProvider>(
                        builder: (context, cartProvider, child) {
                          return _iconBox(
                            Icons.shopping_cart_outlined,
                            () {
                              cartProvider.addItem(plant);
                            },
                            Colors.white,
                            Colors.green,
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Buy Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconBox(
    IconData icon,
    VoidCallback onTap,
    Color color,
    Color bgColor,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}

class _PlantInfo extends StatelessWidget {
  final String title;
  final String value;

  const _PlantInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
