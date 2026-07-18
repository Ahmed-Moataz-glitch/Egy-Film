import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/watch_list/domain/use_case/get_saved_movies_use_case.dart';
import 'package:egy_film/features/watch_list/domain/use_case/get_saved_tv_series_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  final GetSavedMoviesUseCase getSavedMoviesUseCase;
  final GetSavedTvSeriesUseCase getSavedTvSeriesUseCase;
  WatchListCubit({
    required this.getSavedMoviesUseCase,
    required this.getSavedTvSeriesUseCase,
  }) : super(WatchListInitial());

  void getSavedMovies() {
    List<MovieModel> savedMovies = getSavedMoviesUseCase.call();
    emit(WatchListMoviesSuccess(savedMovies));
  }

  void getSavedTvSeries() {
    List<TvSeriesModel> savedTvSeries = getSavedTvSeriesUseCase.call();
    emit(WatchListTvSeriesSuccess(savedTvSeries));
  }
}
