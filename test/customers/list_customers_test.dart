import 'dart:io';

import 'package:abacatepay/src/datasources/customers/customers_datasource.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayCustomer datasource;
  late MockClient client;

  bool emptyResponse = false;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/customer/list')) {
        return Response(
          File(
            !emptyResponse
                ? 'test/customers/test_resources/customers_list_model.json'
                : 'test/test_resources/empty_list_data.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayCustomer(AbacatePayMockClient(client: client));
  });

  test('Deve listar todos os clientes com sucesso', () async {
    final customers = await datasource.listCustomers();

    expect(customers.length, 2);
    expect(customers.first.id, 'bill_123456');
    expect(customers.last.id, 'bill_987654');
    expect(customers.last.email, 'abacatepay@daniel_lima.com');
  });

  test('Deve listar vazio com sucesso', () async {
    emptyResponse = true;

    final customers = await datasource.listCustomers();

    expect(customers, isEmpty);
  });
}
