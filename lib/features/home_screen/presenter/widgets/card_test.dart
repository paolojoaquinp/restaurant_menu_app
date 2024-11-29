import 'package:flutter/material.dart';

class CardTest extends StatelessWidget {
  const CardTest({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Card $index',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}