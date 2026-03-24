import 'package:flutter/material.dart';

void main() {
  runApp(const ListaContatos());
}

class ListaContatos extends StatelessWidget {
  const ListaContatos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo, 
      ),
      home: const TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  static const List<Map<String, String>> _usuarios = [
    {"nome": "João", "telefone": "1111-1111"},
    {"nome": "Vitória", "telefone": "2222-2222"},
    {"nome": "Kayque", "telefone": "4949-4949"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.indigo.withValues(alpha: 0.1),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _usuarios.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12), // Espaço entre os cartões
        itemBuilder: (context, index) {
          final usuario = _usuarios[index];
          return Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(usuario['nome']![0], style: const TextStyle(color: Colors.white)),
              ),
              title: Text(
                usuario['nome']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(usuario['telefone']!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(
                    nome: usuario['nome']!,
                    telefone: usuario['telefone']!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.nome, required this.telefone});

  final String nome;
  final String telefone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true, // Faz o conteúdo subir até o topo
      body: Column(
        children: [
          // Um cabeçalho estiloso
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Colors.blueAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(nome, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Informações do contato
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.indigo),
                title: const Text("Telefone"),
                subtitle: Text(telefone),
              ),
            ),
          ),
          const Spacer(), // Empurra os botões para baixo
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _botaoAcao(Icons.call, "Ligar", Colors.green),
                _botaoAcao(Icons.message, "Mensagem", Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _botaoAcao(IconData icone, String rotulo, Color cor) {
    return Column(
      children: [
        FloatingActionButton(
          heroTag: rotulo, // Necessário para não dar erro com múltiplos FABs
          onPressed: () {},
          backgroundColor: cor,
          child: Icon(icone, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(rotulo, style: TextStyle(color: cor, fontWeight: FontWeight.w600)),
      ],
    );
  }
}