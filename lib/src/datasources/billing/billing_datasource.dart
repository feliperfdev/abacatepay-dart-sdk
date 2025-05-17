import 'package:abacatepay/abacatepay.dart';
import 'package:abacatepay/src/client/abacatepay_client.dart';

final class AbacatePayBilling {
  late final AbacatePayClient _client;

  AbacatePayBilling(AbacatePayClient client) {
    _client = client;
  }

  static const _basePath = '/billing/';

  /// Permite que você recupere uma lista de todas as cobranças criadas.
  Future<List<AbacatePayBillingResponse>> listBillings() async {
    try {
      final response = await _client.get('${_basePath}list');

      final data = List<Map<String, dynamic>>.from(response['data']);

      return data.map(AbacatePayBillingResponse.fromData).toList();
    } on AbacatePayClientException catch (_) {
      rethrow;
    } catch (genericException, st) {
      throw AbacatePayResponseException(
        externalExceptionMessage: genericException.toString(),
        stackTrace: st.toString(),
      );
    }
  }

  /// Permite que você crie um link de cobrança pro seu cliente pagar você.
  Future<AbacatePayBillingResponse> createBilling(
    AbacatePayBillingData billingData,
  ) async {
    try {
      final response = await _client.post(
        '${_basePath}create',
        body: billingData.toMap(),
      );

      final data = response['data'] as Map<String, dynamic>;

      return AbacatePayBillingResponse.fromData(data);
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
