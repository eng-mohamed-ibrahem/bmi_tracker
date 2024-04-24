import 'package:flutter/material.dart';

class BmiIndexScale extends StatelessWidget {
  const BmiIndexScale({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          dense: true,
          leading: SizedBox.square(
            dimension: 20,
            child: Container(
              color: const Color.fromRGBO(233, 206, 11, 1),
            ),
          ),
          title: const Text('Underweight: less than 18.5'),
        ),
        ListTile(
          dense: true,
          leading: SizedBox.square(
            dimension: 20,
            child: Container(
              color: const Color.fromRGBO(0, 210, 0, 1),
            ),
          ),
          title: const Text('Normal weight: 18.5 - 25'),
        ),
        ListTile(
          dense: true,
          leading: SizedBox.square(
            dimension: 20,
            child: Container(
              color: const Color.fromRGBO(249, 148, 0, 1),
            ),
          ),
          title: const Text('Overweight: 25 - 30'),
        ),
        ListTile(
          dense: true,
          leading: SizedBox.square(
            dimension: 20,
            child: Container(
              color: const Color.fromRGBO(205, 17, 1, 1),
            ),
          ),
          title: const Text('Obesity: greater than 30'),
        ),
      ],
    );
  }
}
