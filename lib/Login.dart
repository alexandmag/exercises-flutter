import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginExercise extends StatefulWidget {
  @override
  _LoginExerciseState createState() => _LoginExerciseState();
}

class _LoginExerciseState extends State<LoginExercise> {
  double generalFont = 10.0;
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _nascController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String inputCheck = '';
  bool notifEmail = true;
  bool notifWpp = true;
  bool showPass = false;

  _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', _nomeController.text);
    await prefs.setString('phone', _phoneController.text);
    await prefs.setString('pass', _passController.text);
    await prefs.setString('nasc', _nascController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('sexo', inputCheck);
    await prefs.setString('notWhats', notifWpp.toString());
    await prefs.setString('notEmail', notifEmail.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Crie uma Conta', style: TextStyle(fontSize: generalFont)),
      ),
      //drawer: Drawer(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _nomeController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      label: Text('Nome'),
                      labelStyle: TextStyle(fontSize: generalFont)),
                  style: TextStyle(fontSize: generalFont),
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  controller: _nascController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      label: Text('Data Nascimento'),
                      labelStyle: TextStyle(fontSize: generalFont)),
                  style: TextStyle(fontSize: generalFont),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(fontSize: generalFont)),
                  style: TextStyle(fontSize: generalFont),
                ),
                TextField(
                  controller: _passController,
                  obscureText: showPass,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      icon: Icon(
                          showPass ? Icons.visibility_off : Icons.visibility),
                    ),
                    label: Text(
                      'Senha',
                      style: TextStyle(fontSize: generalFont),
                    ),
                    labelStyle: TextStyle(fontSize: generalFont),
                  ),
                  style: TextStyle(fontSize: generalFont),
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  maxLength: 20,
                  decoration: InputDecoration(
                      label: Text('Telefone'),
                      labelStyle: TextStyle(fontSize: generalFont)),
                  style: TextStyle(fontSize: generalFont),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    /*Text(
                      'Gênero:',
                      style: TextStyle(fontSize: generalFont),
                    ),*/
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Masculino',
                      style: TextStyle(fontSize: generalFont),
                    ),
                    Radio(
                        value: 'M',
                        groupValue: inputCheck,
                        onChanged: (val) {
                          setState(() {
                            inputCheck = val!;
                          });
                        }),
                    Text(
                      'Feminino',
                      style: TextStyle(fontSize: generalFont),
                    ),
                    Radio(
                        value: 'F',
                        groupValue: inputCheck,
                        onChanged: (val) {
                          setState(() {
                            inputCheck = val!;
                          });
                        }),
                    Text(
                      'Prefiro não dizer',
                      style: TextStyle(fontSize: generalFont),
                    ),
                    Radio(
                        value: 'P',
                        groupValue: inputCheck,
                        onChanged: (val) {
                          setState(() {
                            inputCheck = val!;
                          });
                        }),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      /*Text(
                        'Notificaćões',
                        style: TextStyle(fontSize: generalFont),
                      ),*/
                      SwitchListTile(
                          title: Text('Notificações por E-mail',
                              style: TextStyle(fontSize: generalFont)),
                          value: notifEmail,
                          onChanged: (bool val) {
                            setState(() {
                              notifEmail = val;
                            });
                          }),
                      SwitchListTile(
                          title: Text('Mensagens por Whatsapp',
                              style: TextStyle(fontSize: generalFont)),
                          value: notifWpp,
                          onChanged: (bool val) {
                            setState(() {
                              notifWpp = val;
                            });
                          })
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)))),
                    onPressed: () {
                      _salvarDados();
                      Navigator.of(context).pop();
                    },
                    child: Text('Cadastrar',
                        style: TextStyle(fontSize: generalFont))),
                Row(
                  children: [
                    Text(
                      'FontSize:',
                      style: TextStyle(fontSize: generalFont),
                    ),
                    Slider(
                        value: generalFont,
                        min: 10.0,
                        max: 20.0,
                        label: generalFont.toString(),
                        divisions: 5,
                        onChanged: (double val) {
                          setState(() {
                            generalFont = val;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
      ),
    );
  }
}
void main() => runApp(
  MaterialApp(
    home: LoginExercise(),
  ),
);

