import 'package:flutter/material.dart';
import 'detalhes.dart';
import 'package:intl/intl.dart';

class UserDetailPage extends StatelessWidget {
  final UsuarioDetalhe user;

  UserDetailPage(this.user);

  final dateFormatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final formattedBirthDate = dateFormatter.format(DateTime.parse(user.birthDate));
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Usuário'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
                radius: 50, // Tamanho do círculo
              ),
            ),
            SizedBox(height: 16),
            Text('Username: ${user.username}'),
            Text('Nome: ${user.firstName} ${user.lastName}'),
            Text('Data de Nascimento: $formattedBirthDate'), // Data formatada
            Text('Gênero: ${user.gender}'),
            Text('Email: ${user.email}'),
            Text('Telefone: ${user.phone}'),
            Text('Universidade: ${user.university}'),
            Text('Endereço MAC: ${user.macAddress}'),
          ],
        ),
      ),
    );
  }
}