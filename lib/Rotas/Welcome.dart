import 'package:exercicios/Rotas/Infos.dart';
import 'package:exercicios/Lista.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  final String nome;

  const Welcome({required this.nome});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: [
        Container(
            padding: EdgeInsets.all(50),
            child: Text(widget.nome, style: TextStyle(fontSize: 30),)),
        Infos(),
        Lista()
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'List')
          ],
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          }),
    );
  }
}
