class UsuarioDetalhe {
  String username;
  String firstName;
  String lastName;
  String birthDate;
  String image;
  String gender;
  String email;
  String phone;
  String university;
  String macAddress;

  UsuarioDetalhe({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.image,
    required this.gender,
    required this.email,
    required this.phone,
    required this.university,
    required this.macAddress,
  });

  UsuarioDetalhe.fromJson(Map<String, dynamic> json)
  :   username = json['username'].toString(),
      firstName = json['firstName'].toString(),
      lastName = json['lastName'].toString(),
      birthDate = json['birthDate'].toString(),
      image = json['image'].toString(),
      gender = json['gender'].toString(),
      email = json['email'].toString(),
      phone = json['phone'].toString(),
      university = json['university'].toString(),
      macAddress = json['macAddress'].toString();
}