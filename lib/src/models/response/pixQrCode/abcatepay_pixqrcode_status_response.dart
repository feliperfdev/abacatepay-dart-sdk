import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';
import 'package:abacatepay/src/utils/get_enum_by_apikey.dart';

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
    status:
        getEnumByApiKey<PaymentStatus>(
          PaymentStatus.values,
          data[AbacatePayConstants.status],
        )!,
    expiresAt: DateTime.parse(data[AbacatePayConstants.expiresAt]),
  );
}
