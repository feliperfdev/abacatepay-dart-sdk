import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

enum BillingFrequency {
  oneTime(AbacatePayConstants.oneTimeEnum),
  multiplePayments(AbacatePayConstants.multiplePaymentsEnum);

  final String apiKey;

  const BillingFrequency(this.apiKey);
}
