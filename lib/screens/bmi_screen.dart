import 'package:flutter/material.dart';
import 'package:globe_app/widgets/menu_bottom.dart';
import 'package:globe_app/widgets/menu_drawer.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: MenuButtom(),
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
