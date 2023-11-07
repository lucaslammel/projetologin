import 'dart:convert';
import 'usuario_login.dart';
import 'detalhes.dart';
import 'package:http/http.dart' as http;

Future<http.Response> login(usuario, senha) async {
  const url = 'https://dummyjson.com/auth/login';
  final usuarioData = {
    'username': usuario,
    'password': senha
  };
  final resposta = await http.post(
      Uri.parse(url),
      body: usuarioData
  );

  return resposta;

}

Future<UsuarioDetalhe> getUsuarioDetalhe(int userId) async {
  final response = await http.get(Uri.parse('https://dummyjson.com/users/' + userId.toString()));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonData = json.decode(response.body);
    final UsuarioDetalhe user = UsuarioDetalhe.fromJson(jsonData);
    return user;
  } else {
    throw Exception('Falha ao carregar dados da API');
  }
}