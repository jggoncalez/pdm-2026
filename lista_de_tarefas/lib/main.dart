// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      home: const ToDoPage(),
    );
  }
}

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage>{

  final List<String> _arrList = [];
  final TextEditingController _controller = TextEditingController();
  int _qttItems = 0;

  void adicionarTarefa() {
    setState(() {
      if (_controller.text.isNotEmpty){
        _arrList.add(_controller.text);
      }
    });
    _controller.clear();
    _qttItems += 1;
  }

  void removerTarefa(int index) {
    setState(() {
      _arrList.removeAt(index);
      _qttItems -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Tarefas"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onSubmitted: (_) => adicionarTarefa(),
            textInputAction: TextInputAction.send,
          ),
          TextField(
            enabled: false,
            decoration: InputDecoration(
              hintText: _qttItems == 0 ? "Nenhuma tarefa adicionada" : "Total de tarefas: $_qttItems",
            ),
          ),
          ElevatedButton(
            onPressed: adicionarTarefa,
            child: const Text("Adicionar"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _arrList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_arrList[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => removerTarefa(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}