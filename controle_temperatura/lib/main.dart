import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: TemperaturaApp()),
  );
}

class TemperaturaApp extends StatefulWidget {
  const TemperaturaApp({Key? key}) : super(key: key);

  @override
  State<TemperaturaApp> createState() => _TemperaturaAppState();
}

class _TemperaturaAppState extends State<TemperaturaApp> {
  int temperatura = 20;

  void aumentar() {
    setState(() {
      temperatura++;
    });
  }

  void diminuir() {
    setState(() {
      temperatura--;
    });
  }

  @override
  Widget build(BuildContext context) {

    Color corFundo;
    IconData icone;
    String status;

    if (temperatura < 15) {
      corFundo = Colors.blue;
      icone = Icons.ac_unit;
      status = "Frio";
    } else if (temperatura < 30) {
      corFundo = Colors.green;
      icone = Icons.wb_sunny;
      status = "Agradável";
    } else {
      corFundo = Colors.red;
      icone = Icons.local_fire_department;
      status = "Quente";
    }

    return Scaffold(
      appBar: AppBar(title: Text("Controle de Temperatura")),
      backgroundColor: corFundo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$temperatura °C", style: TextStyle(fontSize: 40)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: diminuir, child: Text("-")),
                SizedBox(width: 20),
                ElevatedButton(onPressed: aumentar, child: Text("+")),
              ],
            ),
            Icon(
              icone,
              size: 100,
            ),
            Text(
              status,
              style: TextStyle(fontSize: 28),
            )
          ],
        ),
      ),
    );
  }
}
