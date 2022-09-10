import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/menu_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<HomeScreen> {
  double _imc = 0;
  String _text = '';
  TextEditingController _altura = TextEditingController();
  TextEditingController _peso = TextEditingController();

  void _calculate() {
    final double altura = double.parse(_altura.text)/100;
    final double peso = double.parse(_peso.text);

    if (altura == null || altura <= 0 || peso == null || peso <= 0) {
      setState(() {
        _text = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _imc = peso / (altura * altura);
      if (_imc < 18.5) {
        _text = "Peso baixo";
      } else if (_imc < 25) {
        _text = 'Peso ideal';
      } else if (_imc < 30) {
        _text = 'Sobrepeso';
      } else {
        _text = 'Obesidade';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      drawer:
      MenuComponent(context),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            const Icon(
              Icons.balance
            ),

            TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Peso (kg)',
              ),
              controller: _peso,
            ),

            TextFormField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20
              ),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Altura (cm)',
              ),
              controller: _altura,
            ),

            OutlinedButton(
              onPressed: () {
                _calculate();
              },
              child: Text("Calcular"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            ),

            ListTile(
              title: Text("Resultado: " + _text.toString() + ". IMC:" + _imc.toStringAsFixed(2)),
              leading: Icon(Icons.delete),
            ),

           ],
        ),
      ),
    );
  }
}