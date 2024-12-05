import 'package:flutter/material.dart';

class NutritionLabelWidget extends StatelessWidget {
  const NutritionLabelWidget({
    super.key,
    required this.label,
    required this.value,
    this.icon,
  });

  final String label;
  final String value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              if(icon!=null)
                icon!,
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}