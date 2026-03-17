import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: const SemaforoApp()));
}

class SemaforoApp extends StatefulWidget {
  const SemaforoApp({super.key});
  @override
  State<SemaforoApp> createState() => _SemaforoAppState();
}

class _SemaforoAppState extends State<SemaforoApp> {
  int estado = 0;

  void mudarSemaforo() {
    setState(() => estado = (estado + 1) % 3);
  }

  Widget _luz(Color cor, int index) {
    return Container(
      width: 70,
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: estado == index ? cor : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final atravessar = estado == 2;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(title: const Text("Semáforo de Trânsito")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 120,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _luz(Colors.red, 2),
                  _luz(Colors.yellow, 1),
                  _luz(Colors.green, 0),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Icon(
              atravessar ? Icons.directions_walk : Icons.pan_tool,
              size: 80,
              color: atravessar ? Colors.green : Colors.red,
            ),
            Text(
              atravessar ? "PEDESTRE: ATRAVESSE" : "PEDESTRE: AGUARDE",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: mudarSemaforo,
              child: const Text("Mudar Semáforo"),
            ),
          ],
        ),
      ),
    );
  }
}