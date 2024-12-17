import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.onPressed,
    required this.currentIndex,
  });

  final VoidCallback onPressed;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      color: Colors.transparent,
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
                BackButton(onPressed: onPressed,),
                Text(
                  "Pasta",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 28.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.0, 0.5),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Row(
                key: ValueKey<int>(currentIndex),
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${currentIndex + 1}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '/16',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey, height: 2.0, letterSpacing: 1.5),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
