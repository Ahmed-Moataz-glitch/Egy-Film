import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/similar_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetSimilarTvSeriesUseCase {
    final HomeRepo _homeRepo;
  
    GetSimilarTvSeriesUseCase(this._homeRepo);
  
    Future<ApiResult<SimilarTvSeriesResponseEntity>> call({required int tvSeriesId, required bool isArabic}) {
      return _homeRepo.getSimilarTvSeries(tvSeriesId: tvSeriesId, isArabic: isArabic);
    }
}