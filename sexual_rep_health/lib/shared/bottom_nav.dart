import 'package:flutter/material.dart';

Widget buildBottomNavBar(BuildContext context) {
  final Color maroon = const Color(0xFFc00100);
  final Color background = const Color(0xFFFCF4F4);

  return Container(
    color: background, // Set background color

    child: BottomAppBar(
      height: 60,
      color: background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Next',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ],
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              minimumSize: Size(300, 50),
              backgroundColor: maroon, // Set minimum width
            ),
          ),
        ],
      ),
    ),
  );
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildBottomNavBar(context);
  }
}
