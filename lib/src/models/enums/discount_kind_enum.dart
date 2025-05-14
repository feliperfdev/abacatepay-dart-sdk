import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';

enum DiscountKind {
  percentage(AbacatePayConstants.percentageDiscountEnum),
  fixed(AbacatePayConstants.fixedDiscountEnum);

  final String apiKey;

  const DiscountKind(this.apiKey);
}
