import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/models/dto/coupon/abacatepay_coupon_data.dart';
import 'package:abacatepay/src/models/response/coupon/abacatepay_coupon_response.dart';

final class AbacatePayCoupon {
  late final AbacatePayClient _client;

  AbacatePayCoupon(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/coupon/';

  /// PPermite que você recupere uma lista de todos os seus cupons.
  Future<List<AbacatePayCouponResponse>> listCoupons() async {
    final response = await _client.get('${_basePath}list');

    final data = List<Map<String, dynamic>>.from(response['data']);

    return data.map(AbacatePayCouponResponse.fromData).toList();
  }

  /// Permite que você crie um novo cupom que pode ser usado por seus clientes para aplicar descontos.
  Future<AbacatePayCouponResponse> createCoupon(
    AbacatePayCouponData couponData,
  ) async {
    final response = await _client.post(
      '${_basePath}create',
      body: couponData.toMap(),
    );

    final data = response['data'] as Map<String, dynamic>;

    return AbacatePayCouponResponse.fromData(data);
  }
}
