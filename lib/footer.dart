import 'package:flutter/material.dart';

class FixedBottomBar extends StatelessWidget {
  const FixedBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Main Content'),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_outlined),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.pause_circle),
                  onPressed: () {},
                  color: Colors.blue,
                  iconSize: 32,
                ),
                IconButton(
                  icon: const Icon(Icons.lock_outline),
                  onPressed: () {},
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline),
                  onPressed: () {},
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


