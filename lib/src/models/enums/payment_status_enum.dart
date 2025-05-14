enum PaymentStatus {
  pending('PENDING'),
  expired('EXPIRED'),
  cancelled('CANCELLED'),
  paid('PAID'),
  refunded('REFUNDED');

  final String apiKey;

  const PaymentStatus(this.apiKey);
}
