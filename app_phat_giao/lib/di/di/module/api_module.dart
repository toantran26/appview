import 'dart:async';
import 'package:app_phat_giao/data/remote_source/dictionary_data_remote_source.dart';
import 'package:app_phat_giao/data/remote_source/master_data_remote_source.dart';
import 'package:app_phat_giao/data/remote_source/news_data_remote_source.dart';
import 'package:app_phat_giao/data/remote_source/tag_remote_source.dart';
import 'package:dio/dio.dart';
import 'package:app_phat_giao/@core/di/di_module.dart';
import 'package:app_phat_giao/@core/environment/build_config.dart';
import 'package:app_phat_giao/@core/network/interceptor/auth_interceptor.dart';
import 'package:app_phat_giao/@core/network/interceptor/token_interceptor.dart';
import 'package:get/get.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    Get.put(() => dio);
    // register api
    Get.lazyPut(
        () => MasterDataRemoteSource(dio, baseUrl: dio.options.baseUrl));
    Get.lazyPut(() => TagRemoteSource(dio, baseUrl: dio.options.baseUrl));
    Get.lazyPut(() => NewsDataRemoteSource(dio, baseUrl: dio.options.baseUrl));
    Get.lazyPut(
        () => DictionaryRemoteSource(dio, baseUrl: dio.options.baseUrl));
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      sendTimeout: 5000,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(TokenInterceptor());

    /// Print Log (production mode removal)
    // if (BuildConfig.get()?.flavor != null &&
    //     BuildConfig.get()?.flavor != Flavor.RELEASE) {
    // dio.interceptors.add(
    //     LogInterceptor(requestBody: true, responseBody: true, error: true));
    // }
    return dio;
  }
}
