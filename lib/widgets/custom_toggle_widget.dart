import 'package:flutter/material.dart';

class CustomToggleWidget extends StatefulWidget {
  const CustomToggleWidget({super.key});

  @override
  CustomToggleWidgetState createState() => CustomToggleWidgetState();
}

class CustomToggleWidgetState extends State<CustomToggleWidget> {
  bool _isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      padding: EdgeInsets.all(2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isTrue = true;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: _isTrue ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(_isTrue ? 18 : 0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Week',
                style: TextStyle(color: _isTrue ? Colors.white : Colors.black),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isTrue = false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: !_isTrue ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(!_isTrue ? 18 : 0),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Month',
                style: TextStyle(color: !_isTrue ? Colors.white : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
