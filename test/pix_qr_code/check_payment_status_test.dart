import 'dart:io';

import 'package:abacatepay/src/datasources/pixQrCode/pix_qr_code_datasource.dart';
import 'package:abacatepay/src/models/enums/payment_status_enum.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  late AbacatePayPixQrCode datasource;
  late MockClient client;

  setUpAll(() {
    client = MockClient((request) async {
      if (request.toString().contains('/pixQrCode/check')) {
        return Response(
          File(
            'test/pix_qr_code/test_resources/check_status_model.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayPixQrCode(AbacatePayMockClient(client: client));
  });

  test('Deve verificar o status corretamente', () async {
    final checkedStatus = await datasource.checkPaymentStatus(
      'f99071d3-193f-4b8f-baf0-84dcd18e6054',
    );

    expect(checkedStatus.status, PaymentStatus.pending);
    expect(checkedStatus.expiresAt.day, 25);
  });
}
