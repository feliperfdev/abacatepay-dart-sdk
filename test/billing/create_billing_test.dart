import 'dart:io';

import 'package:abacatepay/abacatepay_dart_sdk.dart';
import 'package:abacatepay/src/datasources/billing/billing_datasource.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayBilling datasource;
  late MockClient client;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/billing/create')) {
        return Response(
          File(
            'test/billing/test_resources/billing_model.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayBilling(AbacatePayMockClient(client: client));
  });

  test('Deve criar uma cobrança com sucesso', () async {
    final createdBilling = await datasource.createBilling(
      AbacatePayBillingData(
        frequency: BillingFrequency.oneTime,
        methods: [AbacatePaymentMethod.pix],
        returnUrl: 'returnUrl',
        completitionId: 'completitionId',
        products: [
          AbacatePayProductData(
            externalId: 'externalId',
            name: 'name',
            description: 'description',
            quantity: 1,
            price: 100,
          ),
        ],
        customerId: 'customerId',
        customer: AbacatePayCustomerData(
          name: 'name',
          cellphone: 'cellphone',
          email: 'email',
          taxId: 'taxId',
        ),
      ),
    );

    expect(createdBilling.id, 'bill_123456');
    expect(createdBilling.products.first.id, 'prod_123456');
    expect(createdBilling.customer.email, 'daniel_lima@abacatepay.com');
    expect(createdBilling.status, PaymentStatus.pending);
  });
}
