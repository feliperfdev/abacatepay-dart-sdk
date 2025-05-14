import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';
import 'package:abacatepay/src/utils/get_enum_by_apikey.dart';

final class AbacatePayPixQrCodeResponse {
  final String id;
  final int amount;
  final PaymentStatus status;
  final bool devMode;
  final String brCode;
  final String brCodeBase64;
  final int platformFee;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;

  AbacatePayPixQrCodeResponse({
    required this.id,
    required this.amount,
    required this.status,
    required this.devMode,
    required this.brCode,
    required this.brCodeBase64,
    required this.platformFee,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });

  factory AbacatePayPixQrCodeResponse.fromData(Map<String, dynamic> data) {
    return AbacatePayPixQrCodeResponse(
      id: data[AbacatePayConstants.id],
      amount: data[AbacatePayConstants.amount],
      status:
          getEnumByApiKey<PaymentStatus>(
            PaymentStatus.values,
            data[AbacatePayConstants.status],
          )!,
      devMode: data[AbacatePayConstants.devMode],
      brCode: data[AbacatePayConstants.brCode],
      brCodeBase64: data[AbacatePayConstants.brCodeBase64],
      platformFee: data[AbacatePayConstants.platformFee],
      createdAt: DateTime.parse(data[AbacatePayConstants.createdAt]),
      updatedAt: DateTime.parse(data[AbacatePayConstants.updatedAt]),
      expiresAt: DateTime.parse(data[AbacatePayConstants.expiresAt]),
    );
  }

  Map<String, dynamic> toMap() => {
    AbacatePayConstants.id: id,
    AbacatePayConstants.amount: amount,
    AbacatePayConstants.status: status.apiKey,
    AbacatePayConstants.devMode: devMode,
    AbacatePayConstants.brCode: brCode,
    AbacatePayConstants.brCodeBase64: brCodeBase64,
    AbacatePayConstants.platformFee: platformFee,
    AbacatePayConstants.createdAt: createdAt.toIso8601String(),
    AbacatePayConstants.updatedAt: updatedAt.toIso8601String(),
    AbacatePayConstants.expiresAt: expiresAt.toIso8601String(),
  };
}
