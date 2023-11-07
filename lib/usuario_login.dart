class UsuarioLogin{
  String id;
  String usuario;
  String email;
  String nome;
  String sobrenome;
  String genero;
  String imagem;
  String token;

  UsuarioLogin({
    required this.id,
    required this.usuario,
    required this.email,
    required this.nome,
    required this.sobrenome,
    required this.genero,
    required this.token,
    required this.imagem
  });

  UsuarioLogin.fromJson(Map<String, dynamic> json)
      : id = json['id'].toString(),
        usuario = json['username'].toString(),
        email = json['email'].toString(),
        nome = json['firstName'].toString(),
        sobrenome = json['lastName'].toString(),
        genero = json['gender'].toString(),
        token = json['token'].toString(),
        imagem = json['image'].toString();
}