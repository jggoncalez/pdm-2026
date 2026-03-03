import 'package:flutter/material.dart';
import 'dart:math';

void main() {
 runApp(MaterialApp(home: PaginaRand() ));  
}

class PaginaRand extends StatefulWidget{
  @override 
  _PaginaRandState createState() => _PaginaRandState();
}

class _PaginaRandState extends State<PaginaRand>{
  int number = 0;

  void sortear(){
    setState(() {
      var random = Random();
      number = random.nextInt(11);
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
            Text("Número: $number", style: TextStyle(fontSize: 30)),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: sortear,
              child: Icon(Icons.casino_outlined),
            ),
          ],
        ),
      ),
    );
  }
}