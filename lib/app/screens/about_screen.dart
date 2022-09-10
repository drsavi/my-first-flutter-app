import 'package:flutter/material.dart';
import '../components/menu_component.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AboutScreen> createState() => _MyAboutScreenState();
}

class _MyAboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
      ),

      drawer:
      MenuComponent(context),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sobre',
            ),
          ],
        ),
      ),
    );
  }
}