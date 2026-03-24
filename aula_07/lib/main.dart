import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

// -------------------------- TELA 1 --------------------------

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  final String nome = "Joao";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Ir para segunda tela"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SegundaTela(nome: nome))
            );
          },
        ),
      ),
    );
  }
}
// -------------------------- TELA 2 --------------------------

class SegundaTela extends StatelessWidget {
  const SegundaTela({super.key, required this.nome});

  final String nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Bem-vindo a segunda página, $nome", style: TextStyle(color: Colors.green, fontSize: 20),),
            ElevatedButton(
              child: Text("Voltar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
    
  }
}