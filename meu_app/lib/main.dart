import 'package:flutter/material.dart';

void main() {
  runApp(meuapp());
}

class meuapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tarefas", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          ),

        body: ListView(
            children: [
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Estudar Flutter'),
              trailing: Icon(Icons.delete)
            ),
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Praticar Dart'),
              trailing: Icon(Icons.delete)
            ),
            ListTile(
              leading: Icon(Icons.radio_button_unchecked),
              title: Text('Criar um App'),
              trailing: Icon(Icons.delete)
            ),
            ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            print('Fui pressionado'),
          },
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          child: const Icon(Icons.add, color: Color.fromARGB(255, 255, 255, 255),)
          ),
      ),
    );
  }
}