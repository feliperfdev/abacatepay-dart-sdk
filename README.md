<div align='center'>
    <img src='https://raw.githubusercontent.com/feliperfdev/abacatepay-dart-sdk/refs/heads/main/assets/logo.svg' height=150/>
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
  - ✅ List your coupons
  - ✅ Create new coupon

## Getting started

Add this package to your dart/flutter project `pubspec.yaml` and import it to your code:

```dart
import 'package:abacatepay/abacatepay.dart';
```

## Usage

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

final paymentStatus = await abacatePixQrCode.simulatePayment(String qrCodePixID); // AbacatePayPixQrCodeStatusResponse

final simulatedPayment = await abacatePixQrCode.checkPaymentStatus(String qrCodePixID); // AbacatePayPixQrCodeStatusResponse
```

### Coupons Methods

```dart
final abacateCoupons = abacatePay.coupons;

final createdCoupon = await abacateCoupons.createCoupon(AbacatePayCouponData); // AbacatePayCouponResponse

final coupons = await abacateCoupons.lisCounpons(); // List<AbacatePayCouponResponse>
```

### Sample video

[Watch it here!](https://raw.githubusercontent.com/feliperfdev/abacatepay-dart-sdk/refs/heads/main/assets/sample.mp4)

## Additional information

- [Contribute opening issues or pull-requests](https://github.com/feliperfdev/abacatepay-dart-sdk)
- [AbacatePay](https://www.abacatepay.com/)
- [AbacatePay — Docs](https://docs.abacatepay.com/pages/introduction)

## License

Distributed under the MIT License. See `LICENSE` for more information.
