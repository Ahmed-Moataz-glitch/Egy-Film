import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_details_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetTvSeriesDetailsUseCase {
    final HomeRepo _homeRepo;
  
    GetTvSeriesDetailsUseCase(this._homeRepo);
  
    Future<ApiResult<TvSeriesDetailsResponseEntity>> call({required int tvSeriesId, required bool isArabic}) {
      return _homeRepo.getTvSeriesDetails(tvSeriesId: tvSeriesId, isArabic: isArabic);
    }
}