import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      "BMI Calculator",
      "Weather",
      "Training"
    ];
    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: Text(
        'Globo Fitness',
        style: TextStyle(color: Colors.white, fontSize: 28),
      ),
    ));
    menuTitles.forEach((element) {
      menuItems.add(
        ListTile(
          title: Text(
            element,
            style: TextStyle(fontSize: 18),
          ),
          onTap: (){
            switch (element){
              case 'Home':
                Navigator.pushNamed(context, '/');
                break;
              case 'BMI Calculator':
                Navigator.pushNamed(context, '/bmi');
                break;
              case 'Weather':
                Navigator.pushNamed(context, '/weather');
                break;
              case 'Training':
                Navigator.pushNamed(context, '/training');
                break;
            }
            
          },
        ),
      );
    });
    return menuItems;
  }
}
