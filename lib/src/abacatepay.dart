import 'package:abacatepay/src/client/abacatepay_client.dart';
import 'package:abacatepay/src/datasources/billing/billing_datasource.dart';
import 'package:abacatepay/src/datasources/coupon/coupon_datasource.dart';
import 'package:abacatepay/src/datasources/customers/customers_datasource.dart';
import 'package:abacatepay/src/datasources/pixQrCode/pix_qr_code_datasource.dart';

/// Acesse: [AbacatePay](https://www.abacatepay.com/)
final class AbacatePay {
  /// Métodos relacionados a cobranças.
  late final AbacatePayBilling billing;

  /// Métodos relacionados a clientes.
  late final AbacatePayCustomer customers;

  /// Métodos relacionados ao QrCode PIX.
  late final AbacatePayPixQrCode pixQrCode;

  /// Métodos relacionados a cupons.
  late final AbacatePayCoupon coupon;

  late final String _apiKey;
  late final int _apiVersion;

  AbacatePay({required String apiKey, int apiVersion = 1}) {
    _apiKey = apiKey;
    _apiVersion = apiVersion;

    final client = AbacatePayClient(apiKey: _apiKey, apiVersion: _apiVersion);

    billing = AbacatePayBilling(client);
    customers = AbacatePayCustomer(client);
    pixQrCode = AbacatePayPixQrCode(client);
    coupon = AbacatePayCoupon(client);
  }
}
