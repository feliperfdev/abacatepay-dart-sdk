import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/exceptions/abacatepay_client_exception.dart';
import 'package:abacatepay/src/exceptions/abacatepay_response_exception.dart';
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
    try {
      final response = await _client.get('${_basePath}list');

      final data = List<Map<String, dynamic>>.from(response['data']);

      return data.map(AbacatePayCouponResponse.fromData).toList();
    } on AbacatePayClientException catch (_) {
      rethrow;
    } catch (genericException, st) {
      throw AbacatePayResponseException(
        externalExceptionMessage: genericException.toString(),
        stackTrace: st.toString(),
      );
    }
  }

  /// Permite que você crie um novo cupom que pode ser usado por seus clientes para aplicar descontos.
  Future<AbacatePayCouponResponse> createCoupon(
    AbacatePayCouponData couponData,
  ) async {
    try {
      final response = await _client.post(
        '${_basePath}create',
        body: couponData.toMap(),
      );

      final data = response['data'] as Map<String, dynamic>;

      return AbacatePayCouponResponse.fromData(data);
    } on AbacatePayClientException catch (_) {
      rethrow;
    } catch (genericException, st) {
      throw AbacatePayResponseException(
        externalExceptionMessage: genericException.toString(),
        stackTrace: st.toString(),
      );
    }
  }
}
