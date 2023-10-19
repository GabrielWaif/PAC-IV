import 'package:flutter/material.dart';

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  void goToRegisterCard(BuildContext context) {
    Navigator.pushNamed(context,
        '/card-register'); // Use '/card-register' to match the route you defined in MaterialApp
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shuffle'),
      ),
      body: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.grey,
        child: InkWell(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Título da carta'),
              content: Column(
                children: <Widget>[
                  const Text('Descrição da Carta'),
                  const SizedBox(height: 20), // Espaço entre texto e imagem
                  Image.asset(
                      './assets/lanso.jpg'), // Substitua pelo caminho da sua imagem
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Sair'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('Like'),
                ),
              ],
            ),
          ),
          child: Container(
            height: 700,
            child: Image.asset(
              './assets/carta.jpg',
              fit: BoxFit.fill,

            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToRegisterCard(context);
        },
        tooltip: 'Create card',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
