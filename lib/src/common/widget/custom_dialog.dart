import 'package:flutter/material.dart';

class CustomToastWidget extends StatelessWidget {
  final String message;

  const CustomToastWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 120),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.05),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 0)
          ),
        ],
      ),
      child: Text(message,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.primary)),
    );
  }
}