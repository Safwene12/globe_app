import 'package:flutter/material.dart';
import 'package:globe_app/widgets/menu_bottom.dart';
import 'package:globe_app/widgets/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Globo Fitness"),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuButtom(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover
            )
        ),
        child:Center(
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              'Commit to be fit, dare to be great \nwith global fitness',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  shadows: [Shadow(
                      offset: Offset(1.0,1.0),
                      blurRadius: 2.0,
                      color: Colors.grey
                  )]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
