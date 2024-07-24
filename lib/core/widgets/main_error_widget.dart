import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          ElevatedButton(onPressed: onPressed, child: const Text('Try Again')),
    );
  }
}
