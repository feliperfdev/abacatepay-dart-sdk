import 'package:http/http.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';

class HeaderInterceptor extends InterceptorContract {
  final String apiKey;

  HeaderInterceptor({required this.apiKey});

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers['Authorization'] = 'Bearer $apiKey';
    request.headers['Content-Type'] = 'application/json';

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    return response;
  }
}
