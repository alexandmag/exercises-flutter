import 'package:exercicios/Rotas/Welcome.dart';
import 'package:exercicios/Lista.dart';
import 'package:exercicios/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends StatefulWidget {
  const LoginState({super.key});

  @override
  State<LoginState> createState() => _LoginState();
}

class _LoginState extends State<LoginState> {
  _login() async {
    final prefs = await SharedPreferences.getInstance();
    _passController.text != prefs.getString("pass") ||
        _emailController.text != prefs.getString("email")
        ? showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Invalid Data'),
          content: const Text(
              'Incorrect user and/or password'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    )
        : Navigator.of(context).pushNamed(
      "/boasVindas"
    );
  }

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool verPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox.expand(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'E-mail',
                      filled: true,
                      fillColor: Colors.blueGrey,
                      labelStyle: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 210,
                      child: TextField(
                        controller: _passController,
                        obscureText: verPass,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.blueGrey,
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                          verPass ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          verPass = !verPass;
                        });
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    _login();
                  },
                  child: const Text(
                    'Enter',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('No account?',
                        style: TextStyle(color: Colors.white)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginExercise()));
                      },
                      child: const Text('Create on now',
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Login'),
      ),
      drawer: const Drawer(),
    );
  }
}

void main() => runApp(
      MaterialApp(
        title: "Flutter demo",
        home: const LoginState(),
        initialRoute: "/",
        routes: {
          "/boasVindas": (context) => const Welcome(nome: 'Teste')
        },
      ),
    );
