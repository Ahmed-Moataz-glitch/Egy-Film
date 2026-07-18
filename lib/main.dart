// ignore_for_file: dead_code, unnecessary_null_comparison
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/core/utils/secure_storage.dart';
import 'package:egy_film/core/view/pages/onboarding_page.dart';
import 'package:egy_film/core/view/widgets/app_section.dart';
import 'package:egy_film/core/view_model/language_cubit/language_cubit.dart';
import 'package:egy_film/features/auth/presentation/view/pages/forget_password_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/login_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/register_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/reset_password_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/successful_reset_password_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/verify_code_page.dart';
import 'package:egy_film/features/auth/presentation/view/pages/verify_email_page.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/play_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/presentation/view/pages/details_page.dart';
import 'package:egy_film/features/home/presentation/view/pages/play_details_page.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/features/profile/data/model/user_profile_model.dart';
import 'package:egy_film/firebase_options.dart';
import 'package:egy_film/generated/l10n.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(const MyApp());
// }
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Hive.registerAdapter<MovieModel>(MovieModelAdapter());
  Hive.registerAdapter<TvSeriesModel>(TvSeriesModelAdapter());
  Hive.registerAdapter<UserProfileModel>(UserProfileModelAdapter());
  await Hive.openBox<MovieModel>(AppConstants.moviesBox);
  await Hive.openBox<TvSeriesModel>(AppConstants.tvSeriesBox);
  await Hive.openBox<UserProfileModel>(AppConstants.userProfileBox);
  // FirebaseCrashlytics.instance.crash();
  await Supabase.initialize(
    url: AppConstants.supabaseUrl,
    anonKey: AppConstants.anonKey,
    // debug: true,
  );
  await handleNotification();
  final token = await SecureStorage.getToken();
  // runApp(MyApp(token: token));
  await setupGetIt();
  runApp(MyApp(token: token));
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  debugPrint("Handling a background message: ${message.messageId}");
}

Future<void> handleNotification() async {
  // Handling background messages
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Taking permission
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  debugPrint('User granted permission: ${settings.authorizationStatus}');
  // Handling foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      String title = message.notification!.title ?? '';
      String body = message.notification!.body ?? '';
      debugPrint('Message also contained a notification: Title: $title');
      debugPrint('Message also contained a notification: Body: $body');

      showDialog(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(body),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(navigatorKey.currentContext!).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('A new onMessageOpenedApp event was published!');
    debugPrint('Message data: ${message.data}');
    // final messageData = message.data;
    // if (messageData['task_title'] != null) {
    // Navigator.of(navigatorKey.currentContext!).pushNamed(
    //   AppRoutes.homePage,
    // );
    // }
    Navigator.of(navigatorKey.currentContext!).pushNamed(AppRoutes.appSection);
  });
}

class MyApp extends StatelessWidget {
  final String? token;
  // const MyApp({super.key, this.token});
  const MyApp({super.key, this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 869),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LanguageCubit>(create: (context) => LanguageCubit()),
          ],
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              final languageCubit = LanguageCubit.get(context);
              return MaterialApp(
                title: AppConstants.appName,
                debugShowCheckedModeBanner: false,
                navigatorKey: navigatorKey,
                builder: (context, child) {
                  return OfflineBuilder(
                    child: child!,
                    connectivityBuilder: (context, connectivity, child) {
                      final connected = !connectivity.contains(
                        ConnectivityResult.none,
                      );
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          child,
                          if (!connected)
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Material(
                                color: AppColors.red.withAlpha(220),
                                child: Padding(
                                  padding: EdgeInsets.all(8.r),
                                  child: Text(
                                    S.of(context).no_internet_connection,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.fillColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
                  );
                },
                locale: Locale(languageCubit.getLanguage()),
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                theme: ThemeData(
                  fontFamily: "Almarai",
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                  ),
                ),
                onGenerateInitialRoutes: (initialRoute) {
                  // final token = user?.getIdToken();
                  if (token != null) {
                    return [
                      MaterialPageRoute(
                        builder: (context) => const AppSection(),
                      ),
                    ];
                  } else {
                    return [
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      ),
                    ];
                  }
                },
                onGenerateRoute: (settings) {
                  switch (settings.name) {
                    case AppRoutes.onboarding:
                      return MaterialPageRoute(
                        builder: (context) => const OnboardingPage(),
                      );
                    case AppRoutes.register:
                      final authCubit = settings.arguments as AuthCubit;
                      return MaterialPageRoute(
                        builder: (context) =>
                            RegisterPage(authCubit: authCubit),
                      );
                    case AppRoutes.login:
                      return MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      );
                    case AppRoutes.verifyEmail:
                      final args = settings.arguments as Map<String, dynamic>;
                      final authCubit = args['authCubit'] as AuthCubit;
                      final email = args['email'] as String?;
                      return MaterialPageRoute(
                        builder: (context) =>
                            VerifyEmailPage(authCubit: authCubit, email: email),
                      );
                    case AppRoutes.forgetPassword:
                      final authCubit = settings.arguments as AuthCubit;
                      return MaterialPageRoute(
                        builder: (context) =>
                            ForgetPasswordPage(authCubit: authCubit),
                      );
                    case AppRoutes.verifyCode:
                      final args = settings.arguments as Map<String, dynamic>;
                      final email = args['email'] as String?;
                      final authCubit = args['authCubit'] as AuthCubit;
                      return MaterialPageRoute(
                        builder: (context) =>
                            VerifyCodePage(email: email, authCubit: authCubit),
                      );
                    case AppRoutes.resetPassword:
                      final authCubit = settings.arguments as AuthCubit;
                      return MaterialPageRoute(
                        builder: (context) =>
                            ResetPasswordPage(authCubit: authCubit),
                      );
                    case AppRoutes.successfulResetPassword:
                      return MaterialPageRoute(
                        builder: (context) =>
                            const SuccessfulResetPasswordPage(),
                      );
                    case AppRoutes.appSection:
                      return MaterialPageRoute(
                        builder: (context) => const AppSection(),
                      );
                    case AppRoutes.details:
                      final detailsArgs =
                          settings.arguments as Map<String, dynamic>;
                      final id = detailsArgs['id'] as int;
                      final isMovie = detailsArgs['isMovie'] as bool;
                      final isArabic = detailsArgs['isArabic'] as bool;
                      return MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: getIt<HomeCubit>(),
                          child: DetailsPage(
                            id: id,
                            isMovie: isMovie,
                            isArabic: isArabic,
                          ),
                        ),
                      );
                    case AppRoutes.playDetails:
                      final playModel = settings.arguments as PlayModel;
                      return MaterialPageRoute(
                        builder: (context) =>
                            PlayDetailsPage(playModel: playModel),
                      );
                    default:
                      return null;
                  }
                },
                // onUnknownRoute: (settings) {
                //   switch (settings.name) {
                //     case AppRoutes.home:
                //       return MaterialPageRoute(builder: (context) => const HomePage());
                //     case AppRoutes.learn:
                //       return MaterialPageRoute(builder: (context) => const LearnPage());
                //     case AppRoutes.community:
                //       return MaterialPageRoute(
                //         builder: (context) => const CommunityPage(),
                //       );
                //     case AppRoutes.profile:
                //       return MaterialPageRoute(builder: (context) => const ProfilePage());
                //     default:
                //       return null;
                //   }
                // },
                // initialRoute:  token != null ? AppRoutes.appSection : AppRoutes.onboarding,
                // routes: {
                //   AppRoutes.onboarding: (context) => const OnboardingPage(),
                //   AppRoutes.login: (context) => const LoginPage(),
                //   AppRoutes.register: (context) => const RegisterPage(),
                //   AppRoutes.appSection: (context) => const AppSection(),
                //   // AppRoutes.home: (context) => const HomePage(),
                //   AppRoutes.forgetPassword: (context) => const ForgetPasswordPage(),
                //   AppRoutes.verifyEmail: (context) => const VerifyEmailPage(),
                //   AppRoutes.verifyCode: (context) => const VerifyCodePage(),
                //   AppRoutes.resetPassword: (context) => const ResetPasswordPage(),
                //   AppRoutes.successfulResetPassword: (context) =>
                //       const SuccessfulResetPasswordPage(),
                // },
              );
            },
          ),
        );
      },
    );
  }
}
