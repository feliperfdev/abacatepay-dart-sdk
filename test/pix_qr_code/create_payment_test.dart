import 'dart:io';

import 'package:abacatepay/src/datasources/pixQrCode/pix_qr_code_datasource.dart';
import 'package:abacatepay/src/models/dto/customer/abacatepay_customer_data.dart';
import 'package:abacatepay/src/models/dto/pixQrCode/abacatepay_pixqrcode_data.dart';
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
      if (request.toString().contains('/pixQrCode/create')) {
        return Response(
          File(
            'test/pix_qr_code/test_resources/simulate_model.json',
          ).readAsStringSync(),
          200,
        );
      }

      return Response('{}', 404);
    });

    datasource = AbacatePayPixQrCode(AbacatePayMockClient(client: client));
  });

  test('Deve criar o pagamento corretamente', () async {
    final payment = await datasource.createPayment(
      AbacatePayPixQrCodeData(
        amount: 100,
        expiresIn: 1234,
        description: 'description',
        customer: AbacatePayCustomerData(
          name: 'name',
          cellphone: 'cellphone',
          email: 'email',
          taxId: 'taxId',
        ),
      ),
    );

    expect(payment.status, PaymentStatus.pending);
    expect(payment.brCode, '00020101021226950014br.gov.bcb.pix');
    expect(payment.expiresAt.day, 25);
  });
}
