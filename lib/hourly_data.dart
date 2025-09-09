import 'package:flutter/material.dart';

class additional_card extends StatelessWidget {
  final icon;
  final t;
  final val;
  const additional_card(
      {super.key, required this.icon, required this.t, required this.val});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            t,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            val.toString(),
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
