import 'package:abacatepay/src/exceptions/core_exception.dart';

final class AbacatePayClientException extends CoreException {
  final String externalExceptionMessage;

  AbacatePayClientException({required this.externalExceptionMessage})
    : super('An error ocurred while trying to fetch request.');
}
