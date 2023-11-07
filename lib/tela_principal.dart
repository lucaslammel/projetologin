  import 'package:projetologin/detalhes.dart';
  import 'package:projetologin/repositorio.dart';
  import 'package:projetologin/usuario_detalhes.dart';
  import 'package:projetologin/usuario_login.dart';
  import 'package:flutter/material.dart';

  class TelaPrincipal extends StatefulWidget {
    final UsuarioLogin usuarioLogin;

    const TelaPrincipal({super.key, required this.usuarioLogin});

    @override
    State<TelaPrincipal> createState() => _TelaPrincipalState();
  }

  class _TelaPrincipalState extends State<TelaPrincipal> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text('Tela Principal')
          ),
          body: Center(
              child: Text('Conteúdo')
          ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey.shade500
                ),
                  accountName: Text(widget.usuarioLogin.nome),
                  accountEmail: Text(widget.usuarioLogin.email),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(widget.usuarioLogin.imagem),
                  ),
              ),
              ListTile(
                title: Text('Atualizar Dados'),
                leading: Icon(Icons.add) ,
                onTap: (){
                  // Navegar para a página de detalhes do usuário ao clicar no ListTile
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FutureBuilder<UsuarioDetalhe>(
                      future: getUsuarioDetalhe(int.parse(widget.usuarioLogin.id)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Erro: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            UsuarioDetalhe? user = snapshot.data; // Usando '?' para tratar nulidade
                            if (user != null) {
                              return UserDetailPage(user);
                            } else {
                              return Center(child: Text('Nenhum dado disponível.'));
                            }
                          } else {
                            return Center(child: Text('Nenhum dado disponível.'));
                          }
                        },
                    ),
                  ));
                },
              )
            ],
          ),
        ),
      );
    }
  }
