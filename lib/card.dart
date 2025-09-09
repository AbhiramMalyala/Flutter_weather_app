import 'dart:ui';

import 'package:flutter/material.dart';

class user_card extends StatefulWidget {
  final String time;
  final String temp;
  final String icon_i;
  const user_card(
      {super.key,
      required this.time,
      required this.temp,
      required this.icon_i});

  @override
  State<user_card> createState() => _user_cardState();
}

class _user_cardState extends State<user_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 120,
      // margin: EdgeInsets.all(10),
      child: Card(
        elevation: 50,
        child: Padding(
          padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: BackdropFilter(
              filter: ImageFilter.blur(),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      widget.time,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      widget.icon_i == 'Clouds' ? Icons.cloud : Icons.sunny,
                      size: 40,
                    ),
                    Text(
                      widget.temp,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
