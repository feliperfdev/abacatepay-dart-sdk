import 'package:abacatepay/src/exceptions/core_exception.dart';

final class AbacatePayResponseException extends CoreException {
  final String externalExceptionMessage;
  final String stackTrace;

  AbacatePayResponseException({
    required this.externalExceptionMessage,
    required this.stackTrace,
  }) : super(
         'An error ocurred while trying to parse fetched date to response.',
       );
}
