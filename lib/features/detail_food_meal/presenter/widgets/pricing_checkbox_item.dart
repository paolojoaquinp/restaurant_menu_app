import 'package:flutter/material.dart';

class PricingCheckboxItem extends StatelessWidget {
  const PricingCheckboxItem({
    super.key,
    required this.label,
    required this.price,
  });

  final String label;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 24.0,
            height: 24.0,
            child: Checkbox(
              value: false,
              shape: const CircleBorder(),
              side: const BorderSide(color: Colors.grey,width: 1.5),
              onChanged: (_) {},
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(label,style: TextStyle(color: Colors.grey[400]),),
          ),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[400]
            ),
          ),
        ],
      ),
    );
  }
}
