import 'dart:io';

import 'package:abacatepay/src/datasources/coupon/coupon_datasource.dart';
import 'package:abacatepay/src/models/dto/coupon/abacatepay_coupon_data.dart';
import 'package:abacatepay/src/models/enums/discount_kind_enum.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayCoupon datasource;
  late MockClient client;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/coupon/create')) {
        return Response(
          File(
            'test/coupon/test_resources/coupon_model.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayCoupon(AbacatePayMockClient(client: client));
  });

  test('Deve criar um cupom com sucesso', () async {
    final createdCoupon = await datasource.createCoupon(
      AbacatePayCouponData(
        code: 'TEST123',
        notes: null,
        discountKind: DiscountKind.percentage,
        discount: 10,
        metadata: null,
      ),
    );

    expect(createdCoupon.notes, 'Cupom de desconto pro meu público');
    expect(createdCoupon.discountKind, DiscountKind.percentage);
  });
}
