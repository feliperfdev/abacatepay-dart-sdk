import 'package:abacatepay/src/models/constants/abacatepay_constants.dart';
import 'package:abacatepay/src/models/enums/discount_kind_enum.dart';
import 'package:abacatepay/src/utils/get_enum_by_apikey.dart';

final class AbacatePayCouponResponse {
  /// Identificador único do cupom
  final String code;

  /// Tipo de desconto aplicado, porcentagem ou fixo
  ///
  /// Available options: PERCENTAGE, FIXED
  final DiscountKind discountKind;

  /// Valor de desconto a ser aplicado
  final int discount;

  /// Descrição sobre o cupom
  final String? notes;

  /// Quantidade de vezes em que o cupom pode ser resgatado. -1 Significa que esse cupom pode ser resgatado sem limites
  ///
  /// Default: -1
  final int? maxRedeems;

  /// Objeto chave valor para metadados do cupom
  final Map<String, dynamic>? metadata;

  AbacatePayCouponResponse({
    required this.code,
    required this.notes,
    this.maxRedeems = -1,
    required this.discountKind,
    required this.discount,
    required this.metadata,
  });

  factory AbacatePayCouponResponse.fromData(Map<String, dynamic> data) {
    return AbacatePayCouponResponse(
      code: data[AbacatePayConstants.id],
      notes: data[AbacatePayConstants.notes],
      maxRedeems: data[AbacatePayConstants.maxRedeems],
      discountKind:
          getEnumByApiKey<DiscountKind>(
            DiscountKind.values,
            data[AbacatePayConstants.discountKind],
          )!,
      discount: data[AbacatePayConstants.discount],
      metadata: data[AbacatePayConstants.metadata],
    );
  }
}
