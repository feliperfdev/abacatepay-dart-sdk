enum BillingStatus {
  pending('PENDING'),
  expired('EXPIRED'),
  cancelled('CANCELLED'),
  paid('PAID'),
  refunded('REFUNDED');

  final String apiKey;

  const BillingStatus(this.apiKey);
}
