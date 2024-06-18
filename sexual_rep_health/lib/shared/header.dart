import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  Header({required this.title});

  final Color background = const Color(0xFFFCF4F4);
  final Color maroon = const Color(0xFFc00100);
  double _progressValue = 0.4;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return headerBar(screenWidth);
  }

  Widget headerBar(double screenWidth) {
    return Column(
      children: [
        AppBar(
          backgroundColor: background,
          toolbarHeight: 30, // Adjust height as needed
          leading: Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/home.png',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Image.asset(
                'assets/nav_button.png',
                width: 60,
                height: 40,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 50,
              ),
            ),
            Container(
              width: screenWidth,
              height: 50,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 15,
                          color:
                              Colors.grey.withOpacity(0.5), // Fade grey color
                        ),
                        onPressed: () {
                          // Handle back arrow onPressed event
                        },
                      ),
                      SizedBox(width: 1),
                      Text(
                        'Back',
                        style: TextStyle(
                          color:
                              Colors.grey.withOpacity(0.5), // Fade grey color
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: maroon,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: maroon,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(maroon),
                minHeight: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
