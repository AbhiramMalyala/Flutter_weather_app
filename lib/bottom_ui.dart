import 'package:flutter/material.dart';
import './api_call.dart';

class Bottom_ui extends StatelessWidget {
  final Function(String) onSearch;
  const Bottom_ui({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Row(
        children: [
          // Make TextField take available space
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.black),
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter the city name',
                hintStyle: TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.location_city),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              onSearch(textEditingController.text);
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
