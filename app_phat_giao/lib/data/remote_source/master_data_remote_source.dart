import 'package:app_phat_giao/data/model/category.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/banner.dart';

part 'master_data_remote_source.g.dart';

@RestApi()
abstract class MasterDataRemoteSource {
  factory MasterDataRemoteSource(Dio dio, {String baseUrl}) =
      _MasterDataRemoteSource;

  @GET("/api/jsonCateHome")
  Future<List<Category>> getCategoriesMenu();

  @GET("/api/jsonAllCate")
  Future<List<Category>> getAllCategories();

  @GET("/api/jsonAds1")
  Future<List<BannerResponse>> getTopHomeBanner();

  @GET("/api/jsonAds2")
  Future<List<BannerResponse>> getMiddleHomeBanner();
}
