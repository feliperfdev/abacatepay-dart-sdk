import 'dart:io';

import 'package:abacatepay/src/datasources/billing/billing_datasource.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayBilling datasource;
  late MockClient client;

  bool emptyResponse = false;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/billing/list')) {
        return Response(
          File(
            !emptyResponse
                ? 'test/billing/test_resources/billings_list_model.json'
                : 'test/test_resources/empty_list_data.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayBilling(AbacatePayMockClient(client: client));
  });

  test('Deve listar todas as cobranças com sucesso', () async {
    final billings = await datasource.listBillings();

    expect(billings.length, 2);
    expect(billings.last.id, 'bill_654321');
  });

  test('Deve listar vazio com sucesso', () async {
    emptyResponse = true;

    final billings = await datasource.listBillings();

    expect(billings, isEmpty);
  });
}
