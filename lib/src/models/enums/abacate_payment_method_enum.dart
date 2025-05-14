import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

enum AbacatePaymentMethod {
  pix(AbacatePayConstants.pixEnum);

  final String apiKey;

  const AbacatePaymentMethod(this.apiKey);
}
