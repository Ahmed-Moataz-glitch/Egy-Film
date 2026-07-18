import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/popular_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetPopularTvSeriesUseCase {
    final HomeRepo _homeRepo;
  
    GetPopularTvSeriesUseCase(this._homeRepo);
  
    Future<ApiResult<PopularTvSeriesResponseEntity>> call(bool isArabic) {
      return _homeRepo.getPopularTvSeries(isArabic);
    }
}