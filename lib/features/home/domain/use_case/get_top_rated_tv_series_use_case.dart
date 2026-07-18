import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_tv_series_response_dto.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetTopRatedTvSeriesUseCase {
    final HomeRepo _homeRepo;
  
    GetTopRatedTvSeriesUseCase(this._homeRepo);
  
    Future<ApiResult<TopRatedTvSeriesResponseEntity>> call(bool isArabic) {
      return _homeRepo.getTopRatedTvSeries(isArabic);
    }
}