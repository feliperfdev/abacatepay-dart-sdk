<div align='center'>
    <img src='assets/logo.svg' height=150/>
</div>

<div align='center'>
<br/>
A Dart/Flutter SDK for <a href='https://www.abacatepay.com/'>AbacatePay</a> payment API. 
</div>

## Features

- Customers
  - ✅ Create customers
  - ✅ List customers
- Billing
  - ✅ Create billing
  - ✅ List billings
- PixQrCode
  - ✅ Create QrCode PIX
  - ✅ Simulate payment
  - ✅ Check status
- Coupons
  - ⭕ List your coupons
  - ⭕ Create new coupon

## Getting started

Add this package to your dart/flutter project `pubspec.yaml`:

```yaml
abacatepay: ^1.0.0
```

## Usage

```dart
import 'package:abacatepay/abacatepay_dart_sdk.dart';
```

```dart
final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');
```

### Customers Methods

```dart
final abacateCustomers = abacatePay.customers;

final customers = await customers.listCustomers(); // List<AbacatePayCustomerResponse>

final createdCustomer = await abacateCustomers.createCustomer(AbacatePayCustomerData); // AbacatePayCustomerResponse
```

### Billing Methods

```dart
final abacateBillings = abacatePay.billing;

final billings = await abacateBillings.listBillings(); // List<AbacatePayBillingResponse>

final createdBilling = await abacateBillings.createBilling(AbacatePayBillingData); // AbacatePayBillingResponse
```

### PixQrCode Methods

```dart
final abacatePixQrCode = abacatePay.pixQrCode;

final createdPayment = await abacatePixQrCode.createPayment(AbacatePayPixQrCodeData); // List<AbacatePayPixQrCodeResponse>

final paymentStatus = await abacatePixQrCode.simulatePayment(AbacatePayPixQrCodeData); // AbacatePayPixQrCodeStatusResponse

final simulatedPayment = await abacatePixQrCode.checkPaymentStatus(AbacatePayPixQrCodeData); // AbacatePayPixQrCodeStatusResponse
```

## Additional information

- [Contribute oppening issues or pull-requests](https://github.com/feliperfdev/abacatepay-dart-sdk)
- [AbacatePay](https://www.abacatepay.com/)
- [AbacatePay — Docs](https://docs.abacatepay.com/pages/introduction)

## License

Distributed under the MIT License. See `LICENSE` for more information.
