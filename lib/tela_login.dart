import 'dart:convert';
import 'dart:html';

import 'package:projetologin/repositorio.dart';
import 'package:projetologin/usuario_login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'tela_principal.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController(text: 'kminchelle');
  final senhaController = TextEditingController(text: '0lelplR');
  bool isLogginIn = false;

  Future<void> loginUsuario() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLogginIn = true;
      });

      Response res = await login(usuarioController.text, senhaController.text);

      if (res.statusCode == 200) {
        final usuarioLogin = UsuarioLogin.fromJson(jsonDecode(res.body));
        //print(usuarioLogin.nome);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TelaPrincipal(usuarioLogin: usuarioLogin))
        );
      } else if (res.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Usuário incorreto.'),
              backgroundColor: Colors.red.shade500,
            )
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Erro: ${res.statusCode}'),
              backgroundColor: Colors.red,
            )
        );
      }
      setState(() {
        isLogginIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Opacity(opacity: 0.4, child: Icon(Icons.person_outlined, size: 100, color: Colors.blue)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: usuarioController,
                validator: (valor){
                  if(valor== null || valor.isEmpty)
                    return 'Preencha o ID de usuário';
                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'ID de usuário',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: senhaController,
                validator: (valor){
                  if(valor== null || valor.isEmpty)
                    return 'Preencha a senha';
                  return null;
                },
                obscureText: true,
                maxLength: 8,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: loginUsuario,
                      child: isLogginIn ? CircularProgressIndicator() : Text('Fazer login'),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
