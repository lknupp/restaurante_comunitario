import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text, required this.isTitle});
  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isTitle)
          Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        if (!isTitle)
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
