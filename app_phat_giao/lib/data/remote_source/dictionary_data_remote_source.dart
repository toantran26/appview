import 'package:app_phat_giao/data/model/dictitionary.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dictionary_data_remote_source.g.dart';

@RestApi()
abstract class DictionaryRemoteSource {
  factory DictionaryRemoteSource(Dio dio, {String baseUrl}) =
      _DictionaryRemoteSource;

  @GET("/api/dictionary?kw={word}")
  Future<List<DicritionaryWord>> searchWordInDictionary(
      @Path("word") String word);

  @GET("/api/dictionaryDetail?id={id}")
  Future<List<DicritionaryWord>> wordInDictionaryDetail(@Path("id") String id);
}
