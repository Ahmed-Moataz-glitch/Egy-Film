import 'package:egy_film/features/auth/data/firebase/firebase_authentication.dart';
import 'package:egy_film/features/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:egy_film/features/auth/data/repo/repo/auth_repo_impl.dart';
import 'package:egy_film/features/auth/domain/repo/data_source/auth_data_source.dart';
import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:egy_film/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/login_with_google_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/logout_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/register_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/reset_password_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/send_otp_for_existing_user_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/send_otp_for_new_user_use_case.dart';
import 'package:egy_film/features/auth/domain/use_case/validate_otp_use_case.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/features/home/data/api/home_api.dart';
import 'package:egy_film/features/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:egy_film/features/home/data/repo/repo/home_repo_impl.dart';
import 'package:egy_film/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';
import 'package:egy_film/features/home/domain/use_case/get_airing_today_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_movie_details_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_movie_trailers_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_popular_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_popular_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_similar_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_similar_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_top_rated_tv_series_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_tv_series_details_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/get_tv_series_trailers_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/is_movie_saved_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/is_tv_series_saved_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/save_movie_use_case.dart';
import 'package:egy_film/features/home/domain/use_case/save_tv_series_use_case.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/features/profile/data/api/profile_api.dart';
import 'package:egy_film/features/profile/data/repo/data_source/profile_data_source_impl.dart';
import 'package:egy_film/features/profile/data/repo/repo/profile_repo_impl.dart';
import 'package:egy_film/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:egy_film/features/profile/domain/use_case/get_user_info_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/get_user_profile_image_url_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/pick_image_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/save_user_profile_image_url_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/upload_profile_image_use_case.dart';
import 'package:egy_film/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:egy_film/features/search/data/api/search_api.dart';
import 'package:egy_film/features/search/data/repo/data_source/search_data_source_impl.dart';
import 'package:egy_film/features/search/data/repo/repo/search_repo_impl.dart';
import 'package:egy_film/features/search/domain/repo/data_source/search_data_source.dart';
import 'package:egy_film/features/search/domain/repo/repo/search_repo.dart';
import 'package:egy_film/features/search/domain/use_case/get_movies_search_use_case.dart';
import 'package:egy_film/features/search/domain/use_case/get_tv_series_search_use_case.dart';
import 'package:egy_film/features/search/presentation/view_model/search_cubit.dart';
import 'package:egy_film/features/watch_list/data/api/watch_list_api.dart';
import 'package:egy_film/features/watch_list/data/repo/data_source/watch_list_data_source_impl.dart';
import 'package:egy_film/features/watch_list/data/repo/repo/watch_list_repo_impl.dart';
import 'package:egy_film/features/watch_list/domain/repo/data_source/watch_list_data_source.dart';
import 'package:egy_film/features/watch_list/domain/repo/repo/watch_list_repo.dart';
import 'package:egy_film/features/watch_list/domain/use_case/get_saved_movies_use_case.dart';
import 'package:egy_film/features/watch_list/domain/use_case/get_saved_tv_series_use_case.dart';
import 'package:egy_film/features/watch_list/presentation/view_model/watch_list_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<FirebaseAuthentication>(() => FirebaseAuthentication());
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getIt<FirebaseAuthentication>()),
  );
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt<AuthDataSource>()));
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUseCase>(
    () => LoginWithEmailAndPasswordUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(() => LogoutUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(getIt<AuthRepo>()));
  getIt.registerLazySingleton<ResetPasswordUseCase>(
    () => ResetPasswordUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SendOtpForExistingUserUseCase>(
    () => SendOtpForExistingUserUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<SendOtpForNewUserUseCase>(
    () => SendOtpForNewUserUseCase(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<ValidateOtpUseCase>(
    () => ValidateOtpUseCase(getIt<AuthRepo>()),
  );
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      loginWithGoogleUseCase: getIt<LoginWithGoogleUseCase>(),
      loginWithEmailAndPasswordUseCase:
          getIt<LoginWithEmailAndPasswordUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      resetPasswordUseCase: getIt<ResetPasswordUseCase>(),
      sendOtpForExistingUserUseCase: getIt<SendOtpForExistingUserUseCase>(),
      sendOtpForNewUserUseCase: getIt<SendOtpForNewUserUseCase>(),
      validateOtpUseCase: getIt<ValidateOtpUseCase>(),
    ),
  );

  getIt.registerSingleton<HomeApi>(HomeApi());
  getIt.registerSingleton<HomeDataSource>(HomeDataSourceImpl(getIt<HomeApi>()));
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt<HomeDataSource>()));
  getIt.registerSingleton<GetAiringTodayTvSeriesUseCase>(
    GetAiringTodayTvSeriesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetMovieDetailsUseCase>(
    GetMovieDetailsUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetMovieTrailersUseCase>(
    GetMovieTrailersUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetPopularTvSeriesUseCase>(
    GetPopularTvSeriesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetSimilarMoviesUseCase>(
    GetSimilarMoviesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetSimilarTvSeriesUseCase>(
    GetSimilarTvSeriesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetTopRatedMoviesUseCase>(
    GetTopRatedMoviesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetTopRatedTvSeriesUseCase>(
    GetTopRatedTvSeriesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetTvSeriesDetailsUseCase>(
    GetTvSeriesDetailsUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<GetTvSeriesTrailersUseCase>(
    GetTvSeriesTrailersUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<IsMovieSavedUseCase>(
    IsMovieSavedUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<IsTvSeriesSavedUseCase>(
    IsTvSeriesSavedUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<SaveMovieUseCase>(
    SaveMovieUseCase(getIt<HomeRepo>()),
  );
  getIt.registerSingleton<SaveTvSeriesUseCase>(
    SaveTvSeriesUseCase(getIt<HomeRepo>()),
  );
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(
      getAiringTodayTvSeriesUseCase: getIt<GetAiringTodayTvSeriesUseCase>(),
      getMovieDetailsUseCase: getIt<GetMovieDetailsUseCase>(),
      getMovieTrailersUseCase: getIt<GetMovieTrailersUseCase>(),
      getNowPlayingMoviesUseCase: getIt<GetNowPlayingMoviesUseCase>(),
      getPopularMoviesUseCase: getIt<GetPopularMoviesUseCase>(),
      getPopularTvSeriesUseCase: getIt<GetPopularTvSeriesUseCase>(),
      getSimilarMoviesUseCase: getIt<GetSimilarMoviesUseCase>(),
      getSimilarTvSeriesUseCase: getIt<GetSimilarTvSeriesUseCase>(),
      getTopRatedMoviesUseCase: getIt<GetTopRatedMoviesUseCase>(),
      getTopRatedTvSeriesUseCase: getIt<GetTopRatedTvSeriesUseCase>(),
      getTvSeriesDetailsUseCase: getIt<GetTvSeriesDetailsUseCase>(),
      getTvSeriesTrailersUseCase: getIt<GetTvSeriesTrailersUseCase>(),
      isMovieSavedUseCase: getIt<IsMovieSavedUseCase>(),
      isTvSeriesSavedUseCase: getIt<IsTvSeriesSavedUseCase>(),
      saveMovieUseCase: getIt<SaveMovieUseCase>(),
      saveTvSeriesUseCase: getIt<SaveTvSeriesUseCase>(),
    ),
  );

  getIt.registerSingleton<SearchApi>(SearchApi());
  getIt.registerSingleton<SearchDataSource>(
    SearchDataSourceImpl(getIt<SearchApi>()),
  );
  getIt.registerSingleton<SearchRepo>(
    SearchRepoImpl(getIt<SearchDataSource>()),
  );
  getIt.registerSingleton<GetMoviesSearchUseCase>(
    GetMoviesSearchUseCase(getIt<SearchRepo>()),
  );
  getIt.registerSingleton<GetTvSeriesSearchUseCase>(
    GetTvSeriesSearchUseCase(getIt<SearchRepo>()),
  );
  getIt.registerFactory<SearchCubit>(
    () => SearchCubit(
      getMoviesSearchUseCase: getIt<GetMoviesSearchUseCase>(),
      getTvSeriesSearchUseCase: getIt<GetTvSeriesSearchUseCase>(),
    ),
  );

  getIt.registerSingleton<WatchListApi>(WatchListApi());
  getIt.registerSingleton<WatchListDataSource>(
    WatchListDataSourceImpl(getIt<WatchListApi>()),
  );
  getIt.registerSingleton<WatchListRepo>(
    WatchListRepoImpl(getIt<WatchListDataSource>()),
  );
  getIt.registerSingleton<GetSavedMoviesUseCase>(
    GetSavedMoviesUseCase(getIt<WatchListRepo>()),
  );
  getIt.registerSingleton<GetSavedTvSeriesUseCase>(
    GetSavedTvSeriesUseCase(getIt<WatchListRepo>()),
  );
  getIt.registerFactory<WatchListCubit>(
    () => WatchListCubit(
      getSavedMoviesUseCase: getIt<GetSavedMoviesUseCase>(),
      getSavedTvSeriesUseCase: getIt<GetSavedTvSeriesUseCase>(),
    ),
  );

  getIt.registerSingleton<ProfileApi>(ProfileApi());
  getIt.registerSingleton<ProfileDataSource>(
    ProfileDataSourceImpl(getIt<ProfileApi>()),
  );
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(getIt<ProfileDataSource>()),
  );
  getIt.registerSingleton<GetUserInfoUseCase>(
    GetUserInfoUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerSingleton<PickImageUseCase>(
    PickImageUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerSingleton<UploadProfileImageUseCase>(
    UploadProfileImageUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerSingleton<SaveUserProfileImageUrlUseCase>(
    SaveUserProfileImageUrlUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerSingleton<GetUserProfileImageUrlUseCase>(
    GetUserProfileImageUrlUseCase(getIt<ProfileRepo>()),
  );
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(
      pickImageUseCase: getIt<PickImageUseCase>(),
      getUserInfoUseCase: getIt<GetUserInfoUseCase>(),
      uploadProfileImageUseCase: getIt<UploadProfileImageUseCase>(),
      saveUserProfileImageUrlUseCase: getIt<SaveUserProfileImageUrlUseCase>(),
      getUserProfileImageUrlUseCase: getIt<GetUserProfileImageUrlUseCase>(),
    ),
  );
}
