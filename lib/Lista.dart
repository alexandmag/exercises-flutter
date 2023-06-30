import 'package:flutter/material.dart';

class Lista extends StatefulWidget {
  @override
  State<Lista> createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  final List _itens = [
    {'name': 'Item 1'},
    {'name': 'Item 2'},
    {'name': 'Item 3'},
    {'name': 'Item 4'},
    {'name': 'Item 5'},
    {'name': 'Item 6'},
    {'name': 'Item 7'},
    {'name': 'Item 8'},
    {'name': 'Item 9'},
    {'name': 'Item 10'},
    {'name': 'Item 11'},
    {'name': 'Item 12'},
    {'name': 'Item 13'},
    {'name': 'Item 14'},
    {'name': 'Item 15'},
    {'name': 'Item 16'},
    {'name': 'Item 17'},
    {'name': 'Item 18'},
    {'name': 'Item 19'},
    {'name': 'Item 20'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _itens.length,
        itemBuilder: (context, i) {
          final item = _itens[i];
          return ListTile(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: const Text('Alerta'),
                  content: Text('Voce clicou no item ${i+1}'),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Sim')),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Não')),
                  ],
                );
              });
            },
            title: Text((i+1).toString()),
            subtitle: Text(item['name']),
          );
        },
      ),
    );
  }
}
