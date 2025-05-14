import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

enum PaymentStatus {
  pending(AbacatePayConstants.pendingEnum),
  expired(AbacatePayConstants.expiredEnum),
  cancelled(AbacatePayConstants.cancelledEnum),
  paid(AbacatePayConstants.paidEnum),
  refunded(AbacatePayConstants.refundedEnum);

  final String apiKey;

  const PaymentStatus(this.apiKey);
}
