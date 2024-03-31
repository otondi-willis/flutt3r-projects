import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const backgroundColor = Color(0xFFFCF4F4);
const maroon = Color(0xFFc00100);

class MyApp extends StatelessWidget {
  Widget healthClientServices(String title, String imagePath) {
    return Column(
      children: [
        Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Container(
            //padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            //margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
            width: 80, // Adjusted width to fit 3 rectangles in a row
            height: 60,
            decoration: BoxDecoration(
              color: maroon,
              borderRadius:
                  BorderRadius.circular(10.0), // Border radius applied here
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 25,
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomNavigatorButtons(double width, String title, String imagePath) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: width, // Adjusted width to fit 3 rectangles in a row
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(10.0), // Border radius applied here
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 25,
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 6.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 200,
                          
                          margin: EdgeInsets.zero,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: maroon,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: backgroundColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 250, // Adjusted width to screenWidth
              height: 230,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10.0), // Border radius applied here
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10.0), // ClipRRect for applying border radius
                child: Image.asset(
                  'assets/equiAfia.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const Text(
                'Our Services',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    healthClientServices(
                        'Medical Services', 'assets/medical_services.PNG'),
                    healthClientServices('Specialists', 'assets/specialists.PNG'),
                    healthClientServices(
                        'Health Records', 'assets/my_health_records.PNG'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    healthClientServices(
                        'My Appointments', 'assets/my_appointments.PNG'),
                    healthClientServices(
                        'Medical Centers', 'assets/medical_centers.PNG'),
                    healthClientServices('About Us', 'assets/about_us.PNG'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Center(
                child: Text(
                  'Your caring health partner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: maroon,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Container(
            width: 280, // Adjusted width to fit 3 rectangles in a row
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ), // Border radius applied here
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomNavigatorButtons(45, 'Explore', 'assets/explore.PNG'),
                    bottomNavigatorButtons(49, 'Payments', 'assets/payments.PNG'),
                    bottomNavigatorButtons(55, 'Home', 'assets/home.PNG'),
                    bottomNavigatorButtons(
                        49, 'Customer Care', 'assets/customer_care.PNG'),
                    bottomNavigatorButtons(45, 'Profile', 'assets/profile.PNG'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
