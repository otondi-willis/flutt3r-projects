import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';
import '../shared/menu_bottom.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Globe Fitness')),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuBottom(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white70,
              ),
              child: Text(
                'Commit to be fit, dare to be great \n with Globo Fitness',
                textAlign: TextAlign.center,
                style: TextStyle(
                  shadows: [
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 2.0,
                      color: Colors.grey,
                    ),
                  ],
                  fontSize: 22,
                ),
              )),
        ),
      ),
    );
  }
}
