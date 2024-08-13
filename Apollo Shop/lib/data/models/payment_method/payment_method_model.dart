class PaymentMethodModel {
  final int? id;
  final int cardNumber;
  final String? nameOnCard;
  final String? expirationDate;
  final bool? defaultPayment;
  final String type;

  PaymentMethodModel({
    this.id,
    required this.cardNumber,
    this.nameOnCard,
    this.expirationDate,
    this.defaultPayment,
    required this.type,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      id: json['id'],
      cardNumber: json['cartNumber'] ?? 0,
      nameOnCard: json['nameOnCard'],
      expirationDate: json['expirationDate'],
      defaultPayment: json['defaultPayment'],
      type: _determineCardType(json['cartNumber'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cartNumber': cardNumber,
      'nameOnCard': nameOnCard,
      'expirationDate': expirationDate,
      'defaultPayment': defaultPayment,
      'type': type,
    };
  }

  static PaymentMethodModel empty() {
    return PaymentMethodModel(
      id: 0,
      cardNumber: 0,
      nameOnCard: '',
      expirationDate: '',
      defaultPayment: false,
      type: '',
    );
  }

  static String _determineCardType(int cardNumber) {
    if (cardNumber.toString().startsWith('4')) {
      return 'Visa';
    } else if (cardNumber.toString().startsWith('5')) {
      return 'MasterCard';
    } else {
      return 'Unknown';
    }
  }
}
