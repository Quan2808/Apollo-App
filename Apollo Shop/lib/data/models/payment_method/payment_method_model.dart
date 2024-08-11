class PaymentMethodModel {
  String name;
  String image;

  PaymentMethodModel({
    required this.name,
    required this.image,
  });

  static PaymentMethodModel empty() {
    return PaymentMethodModel(name: '', image: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      name: json['name'],
      image: json['image'],
    );
  }
}
