class ShipperLoginDTO {
  final String email;
  final String password;

  ShipperLoginDTO({required this.email, required this.password});

  factory ShipperLoginDTO.fromJson(Map<String, dynamic> json) {
    return ShipperLoginDTO(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
