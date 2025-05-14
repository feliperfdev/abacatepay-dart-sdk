import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';

final class AbacatePayPixQrCodeStatusResponse {
  final PaymentStatus status;
  final DateTime expiresAt;

  const AbacatePayPixQrCodeStatusResponse({
    required this.status,
    required this.expiresAt,
  });

  factory AbacatePayPixQrCodeStatusResponse.fromData(
    Map<String, dynamic> data,
  ) => AbacatePayPixQrCodeStatusResponse(
    status: data[AbacatePayConstants.status],
    expiresAt: DateTime.parse(data[AbacatePayConstants.expiresAt]),
  );
}
