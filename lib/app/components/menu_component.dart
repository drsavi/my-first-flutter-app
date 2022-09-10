import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/home_screen.dart';

Widget MenuComponent(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Menu'),
        ),
        ListTile(
          title: const Text('Calculadora de IMC'),
          leading: Icon(Icons.ice_skating),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(title: 'Calculadora da IMC')));
          },
        ),
        ListTile(
          title: const Text('Sobre'),
          leading: Icon(Icons.accessible_forward_outlined),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AboutScreen(title: 'Sobre')));
          },
        ),
      ],
    ),
  );
}
