import 'dart:io';

import 'package:abacatepay/abacatepay_dart_sdk.dart';
import 'package:abacatepay/src/datasources/customers/customers_datasource.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayCustomer datasource;
  late MockClient client;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/customer/create')) {
        return Response(
          File(
            'test/customers/test_resources/customer_model.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayCustomer(AbacatePayMockClient(client: client));
  });

  test('Deve criar um cliente com sucesso', () async {
    final createdCustomer = await datasource.createCustomer(
      AbacatePayCustomerData(
        name: 'name',
        cellphone: 'cellphone',
        email: 'email',
        taxId: '',
      ),
    );

    expect(createdCustomer.id, 'bill_123456');
    expect(createdCustomer.email, 'daniel_lima@abacatepay.com');
    expect(createdCustomer.cellphone, '(11) 4002-8922');
  });
}
