import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const backgroundColor = Color(0xFFFCF4F4);
const maroon = Color(0xFFc00100);

class MyApp extends StatelessWidget {
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
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Border radius applied here
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), // ClipRRect for applying border radius
                child: Image.asset(
                  'assets/equiAfia.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child:const Text(
              'Our Services',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            ),
            
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/medical_services.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Medical Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/specialists.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Specialists',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/my_health_records.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Health Records',
                          style: TextStyle(
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
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/my_appointments.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'My Appointments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/medical_centers.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Medical Centers',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: 80, // Adjusted width to fit 3 rectangles in a row
                    height: 60,
                    decoration: BoxDecoration(
                      color: maroon,
                      borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/about_us.PNG',
                          height: 25,
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'About Us',
                          style: TextStyle(
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
            ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      child: Container(
                        width: 45, // Adjusted width to fit 3 rectangles in a row
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/explore.PNG',
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Explore',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 6.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      child: Container(
                        width: 48, // Adjusted width to fit 3 rectangles in a row
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/payments.PNG',
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Payments',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 6.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      child: Container(
                        width: 55, // Adjusted width to fit 3 rectangles in a row
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/home.PNG',
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 6.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      child: Container(
                        width: 49, // Adjusted width to fit 3 rectangles in a row
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/customer_care.PNG',
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Customer Care',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 6.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5),
                      child: Container(
                        width: 45, // Adjusted width to fit 3 rectangles in a row
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0), // Border radius applied here
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/profile.PNG',
                              height: 25,
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              'Profile',
                              style: TextStyle(
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
                ),
              ),
          ),
      ),
    );
  }
}
