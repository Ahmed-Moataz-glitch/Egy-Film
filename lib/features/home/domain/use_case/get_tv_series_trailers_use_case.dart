import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_trailers_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetTvSeriesTrailersUseCase {
    final HomeRepo _homeRepo;
  
    GetTvSeriesTrailersUseCase(this._homeRepo);
  
    Future<ApiResult<TvSeriesTrailersResponseEntity>> call({required int tvSeriesId, required bool isArabic}) {
      return _homeRepo.getTvSeriesTrailers(tvSeriesId: tvSeriesId, isArabic: isArabic);
    }
}