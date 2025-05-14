enum BillingFrequency {
  oneTime('ONE_TIME'),
  multiplePayments('MULTIPLE_PAYMENTS');

  final String apiKey;

  const BillingFrequency(this.apiKey);
}
