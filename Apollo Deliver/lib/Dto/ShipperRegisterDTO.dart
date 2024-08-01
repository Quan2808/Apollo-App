class ShipperRegisterDTO {
  final String shipperName;
  final String email;
  final String password;

  ShipperRegisterDTO({
    required this.shipperName,
    required this.email,
    required this.password,
  });

  factory ShipperRegisterDTO.fromJson(Map<String, dynamic> json) {
    return ShipperRegisterDTO(
      shipperName: json['shipperName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shipperName': shipperName,
      'email': email,
      'password': password,
    };
  }
}
