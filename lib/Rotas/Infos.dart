import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Infos extends StatefulWidget {
  @override
  State<Infos> createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  String nome = '';
  String email = '';
  String pass = '';
  String phone = '';
  _getInfos() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nome = prefs.getString('nome') ?? 'Sem valor';
      email = prefs.getString('email') ?? 'Sem valor';
      pass = prefs.getString('pass') ?? 'Sem valor';
      phone = prefs.getString('phone') ?? 'Sem valor';
    });
  }

  @override
  Widget build(BuildContext context) {
    _getInfos();
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(50),
          child: Column(
      children: [Text(nome), Text(email), Text(pass), Text(phone)],
    ),
        ));
  }
}
