import 'package:flutter/material.dart';

class RestauranteItemTrait extends StatelessWidget {
  const RestauranteItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white,
        ),
        const SizedBox(width: 4),
        const SizedBox(
          width: 6,
        ),
        Flexible(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
