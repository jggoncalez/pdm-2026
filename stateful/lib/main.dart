import 'package:flutter/material.dart';

void main() {
 runApp(MaterialApp(home: PaginaContador()));  
}

class PaginaContador extends StatefulWidget{
  @override 
  _PaginaContadorState createState() => _PaginaContadorState();
}

class _PaginaContadorState extends State<PaginaContador>{
  int contador = 0;

  void increment(){
    setState(() {
      contador++;
    });
  }
  void decrement(){
    setState(() {
      contador--;
    });
  }
  void reset(){
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meu App Interativo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Cliques: $contador", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: decrement,
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: increment,
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: reset,
                  child: Icon(Icons.restore_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}