import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 40))),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black38),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
