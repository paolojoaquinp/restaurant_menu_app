import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: kToolbarHeight,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Row(
              children: [
                const BackButton(),
                Text(
                  "Pasta",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 28.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '1',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '/16',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey, height: 2.0, letterSpacing: 1.5),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
