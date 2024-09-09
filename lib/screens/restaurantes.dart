import 'package:flutter/material.dart';

class RestaurantesScreen extends StatelessWidget {
  const RestaurantesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Restaurantes',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
