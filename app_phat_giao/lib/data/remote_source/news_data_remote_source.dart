import 'package:app_phat_giao/data/model/detail_news.dart';
import 'package:app_phat_giao/data/model/news.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/comment.dart';

part 'news_data_remote_source.g.dart';

@RestApi()
abstract class NewsDataRemoteSource {
  factory NewsDataRemoteSource(Dio dio, {String baseUrl}) =
      _NewsDataRemoteSource;

  @GET("/?jsonHome3")
  Future<List<NewsIntro>> get3NewsInHome();

  @GET("/?jsonHome5")
  Future<List<NewsIntro>> get5NewsInHome();

  @GET("/api/jsonMostRead")
  Future<List<NewsIntro>> getMostReadNews();

  @GET("/api/mostDate")
  Future<List<NewsIntro>> getMostDateNews();

  @GET("/api/jsonQuote")
  Future<List<QuoteNews>> getQuoteNews();

  @GET("/api/jsonEvent")
  Future<List<NewsIntro>> getEventNews();

  @GET("/?jsonUnderEvent")
  Future<List<NewsIntro>> get9NewsUnderEvent();

  @GET("/api/jsonMedia")
  Future<List<NewsIntro>> getMediaNews();

  @GET("/?jsonUnderMedia")
  Future<List<NewsIntro>> get9NewsUnderMedia();

  @GET("/api/jsonSelective")
  Future<List<NewsIntro>> getSelectiveNews();

  @GET("/api/idDetail?id={id}")
  Future<List<DetailNews>> getDetailNews(@Path("id") String id);

  @GET("/api/cateDetail?cate={id}")
  Future<List<NewsIntro>> getNewsByCateId(@Path("id") String id);

  @GET("/api/detailRelation?jsonRelation={id}")
  Future<List<NewsIntro>> getRelationNewsByNewsId(@Path("id") String id);

  @GET("/api/jsonTrendingDefault?id={trendingID}")
  Future<List<NewsIntro>> getNewsListByTrending(
      @Path("trendingID") String trendingID);

  @GET("/api/jsonSearch?jsonSearch={word}&page={page}")
  Future<List<NewsIntro>> searchByWord(
      @Path("word") String word, @Path("page") String page);

  @GET("/api/tagDetail?id={id}")
  Future<List<NewsIntro>> getNewsByTagId(@Path("id") String id);

  @GET("/api/commentApi?news_id={id}")
  Future<void> commentInNews(
      @Path("id") String newsId, @Body() CommentRequest request);
}
