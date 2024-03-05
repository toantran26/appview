import 'package:app_phat_giao/data/model/search_key.dart';
import 'package:app_phat_giao/data/model/tag.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'tag_remote_source.g.dart';

@RestApi()
abstract class TagRemoteSource {
  factory TagRemoteSource(Dio dio, {String baseUrl}) = _TagRemoteSource;

  @GET("/api/jsontrend")
  Future<List<TrendingTag>> getTrendingTags();

  @GET("/api/searchkey")
  Future<List<SearchKey>> getSearchKeyPopulation();
}
