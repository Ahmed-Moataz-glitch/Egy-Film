import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/airing_today_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetAiringTodayTvSeriesUseCase {
    final HomeRepo _homeRepo;
  
    GetAiringTodayTvSeriesUseCase(this._homeRepo);
  
    Future<ApiResult<AiringTodayTvSeriesResponseEntity>> call(bool isArabic) {
      return _homeRepo.getAiringTodayTvSeries(isArabic);
    }
}