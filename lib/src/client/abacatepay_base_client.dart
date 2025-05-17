import 'dart:io';

import 'package:cronet_http/cronet_http.dart';
import 'package:cupertino_http/cupertino_http.dart';
import 'package:http/io_client.dart';
import 'package:http_interceptor/http_interceptor.dart';

final class AbacatePayBaseClient {
  final List<InterceptorContract>? interceptors;

  AbacatePayBaseClient({this.interceptors});

  Client baseClient() {
    if (Platform.isAndroid) {
      final engine = CronetEngine.build(
        cacheMode: CacheMode.memory,
        cacheMaxSize: 1000000,
      );

      return CronetClient.fromCronetEngine(engine);
    }

    if (Platform.isIOS || Platform.isMacOS) {
      final config =
          URLSessionConfiguration.ephemeralSessionConfiguration()
            ..cache = URLCache.withCapacity(memoryCapacity: 2 * 1024 * 1024)
            ..httpAdditionalHeaders = {'User-Agent': 'Book Agent'};

      return CupertinoClient.fromSessionConfiguration(config);
    }

    return IOClient();
  }

  Client clientWithInterceptor() {
    assert(
      interceptors != null,
      'You should have parse interseptors to use this client method.',
    );

    return InterceptedClient.build(
      client: baseClient(),
      interceptors: interceptors!,
    );
  }
}
