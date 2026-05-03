import 'package:flutter/material.dart';
import '../database/db_helper.dart';
import '../models/item.dart';
import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final items = await DbHelper.instance.getItems();
    items.sort((a, b) => a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase()));
    setState(() {
      _items = items;
    });
  }

  Future<void> _deleteItem(int id) async {
    await DbHelper.instance.deleteItem(id);
    await _loadItems();
  }

  Future<void> _navigateToCreate() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FormScreen()),
    );
    await _loadItems();
  }

  Future<void> _navigateToEdit(Item item) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FormScreen(item: item)),
    );
    await _loadItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cadastro Inteligente'),
      ),
      body: _items.isEmpty
          ? const Center(
              child: Text(
                'Nenhum item cadastrado',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final dt = DateTime.tryParse(item.data);
                final dataFormatada = dt != null
                    ? '${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}'
                    : item.data;
                return ListTile(
                  title: Text(item.titulo),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.descricao),
                      Text(
                        'Criado em: $dataFormatada',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  isThreeLine: true,
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteItem(item.id!),
                  ),
                  onTap: () => _navigateToEdit(item),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToCreate,
        tooltip: 'Novo item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
