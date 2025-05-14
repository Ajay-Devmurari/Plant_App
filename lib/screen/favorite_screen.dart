import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_app/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FavoriteProvider>(
        builder: (context, favProvider, child) {
          final favList = favProvider.favPlant;
          if (favList.isEmpty) {
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
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemBuilder: (context, index) {
              final plant = favList[index];
              return ListTile(
                trailing: IconButton(
                  onPressed: () {
                    favProvider.favItem(plant);
                  },
                  icon: Icon(Icons.remove),
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
            itemCount: favList.length,
          );
        },
      ),
    );
  }
}
