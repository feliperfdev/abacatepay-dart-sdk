<div align='center'>
    <img src='assets/logo.svg' height=150/>
</div>

<div align='center'>
<br/>
A Dart/Flutter SDK for AbacatePay payment API. 
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

## Getting started

Add this package to your dart/flutter project `pubspec.yaml`:

```yaml
abacatepay_dart_sdk: ^1.0.0
```

## Usage

```dart
import 'package:abacatepay_dart_sdk/abacatepay_dart_sdk.dart';

void main() {
    final abacatePay = AbacatePay(apiKey: 'your-abacatepay-api-key');
}

```

## Additional information

- [Open issues or pull-requests](https://github.com/feliperfdev/abacatepay-dart-sdk)
- [AbacatePay](https://www.abacatepay.com/)
