import 'dart:io';

import 'package:abacatepay/src/datasources/coupon/coupon_datasource.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayCoupon datasource;
  late MockClient client;

  bool emptyResponse = false;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/coupon/list')) {
        return Response(
          File(
            !emptyResponse
                ? 'test/coupon/test_resources/list_coupons_model.json'
                : 'test/test_resources/empty_list_data.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayCoupon(AbacatePayMockClient(client: client));
  });

  test('Deve listar todos os cupons com sucesso', () async {
    final coupons = await datasource.listCoupons();

    expect(coupons.length, 1);
  });

  test('Deve listar vazio com sucesso', () async {
    emptyResponse = true;

    final coupons = await datasource.listCoupons();

    expect(coupons, isEmpty);
  });
}
