// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `No internet connection`
  String get no_internet_connection {
    return Intl.message(
      'No internet connection',
      name: 'no_internet_connection',
      desc: '',
      args: [],
    );
  }

  /// `Egy Film`
  String get onboading_page_title1 {
    return Intl.message(
      'Egy Film',
      name: 'onboading_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Egy Film app – watch movies online and the latest Arabic and foreign TV series online with subtitles, in high quality, with the newest releases added continuously.`
  String get onboarding_page_title1_description {
    return Intl.message(
      'Egy Film app – watch movies online and the latest Arabic and foreign TV series online with subtitles, in high quality, with the newest releases added continuously.',
      name: 'onboarding_page_title1_description',
      desc: '',
      args: [],
    );
  }

  /// `TV Series`
  String get onboarding_page_title2 {
    return Intl.message(
      'TV Series',
      name: 'onboarding_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Distinctive TV series, Ramadan and non-Ramadan, of all genres.`
  String get onboarding_page_title2_description {
    return Intl.message(
      'Distinctive TV series, Ramadan and non-Ramadan, of all genres.',
      name: 'onboarding_page_title2_description',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get onboarding_page_title3 {
    return Intl.message(
      'Movies',
      name: 'onboarding_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Distinctive and very enjoyable movies.`
  String get onboarding_page_title3_description {
    return Intl.message(
      'Distinctive and very enjoyable movies.',
      name: 'onboarding_page_title3_description',
      desc: '',
      args: [],
    );
  }

  /// `Plays`
  String get onboarding_page_title4 {
    return Intl.message(
      'Plays',
      name: 'onboarding_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Distinctive, enjoyable, and funny plays from the good old days.`
  String get onboarding_page_title4_description {
    return Intl.message(
      'Distinctive, enjoyable, and funny plays from the good old days.',
      name: 'onboarding_page_title4_description',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bottom_nav_bar_home {
    return Intl.message(
      'Home',
      name: 'bottom_nav_bar_home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get bottom_nav_bar_search {
    return Intl.message(
      'Search',
      name: 'bottom_nav_bar_search',
      desc: '',
      args: [],
    );
  }

  /// `Watch List`
  String get bottom_nav_bar_watch_list {
    return Intl.message(
      'Watch List',
      name: 'bottom_nav_bar_watch_list',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get bottom_nav_bar_profile {
    return Intl.message(
      'Profile',
      name: 'bottom_nav_bar_profile',
      desc: '',
      args: [],
    );
  }

  /// `Logging in...`
  String get login_page_loading {
    return Intl.message(
      'Logging in...',
      name: 'login_page_loading',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get app_toast_error {
    return Intl.message(
      'Error',
      name: 'app_toast_error',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get login_page_title1 {
    return Intl.message(
      'Welcome back',
      name: 'login_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your details to access your workspace.`
  String get login_page_title2 {
    return Intl.message(
      'Enter your details to access your workspace.',
      name: 'login_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get login_page_title3 {
    return Intl.message(
      'Email address',
      name: 'login_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_page_title4 {
    return Intl.message(
      'Password',
      name: 'login_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get login_page_title5 {
    return Intl.message(
      'Forget Password ?',
      name: 'login_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get login_page_button {
    return Intl.message(
      'Sign In',
      name: 'login_page_button',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get login_page_title6 {
    return Intl.message(
      'or continue with',
      name: 'login_page_title6',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get login_page_title7 {
    return Intl.message(
      'Google',
      name: 'login_page_title7',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get login_page_title8 {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'login_page_title8',
      desc: '',
      args: [],
    );
  }

  /// `Create one`
  String get login_page_title9 {
    return Intl.message(
      'Create one',
      name: 'login_page_title9',
      desc: '',
      args: [],
    );
  }

  /// `Registering...`
  String get register_page_loading {
    return Intl.message(
      'Registering...',
      name: 'register_page_loading',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get register_page_title1 {
    return Intl.message(
      'Create your account',
      name: 'register_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get register_page_title2 {
    return Intl.message(
      'Full Name',
      name: 'register_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `enter your full name`
  String get register_page_title2_hint_text {
    return Intl.message(
      'enter your full name',
      name: 'register_page_title2_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get register_page_title3 {
    return Intl.message(
      'Email address',
      name: 'register_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `create an email`
  String get register_page_title3_hint_text {
    return Intl.message(
      'create an email',
      name: 'register_page_title3_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get register_page_title4 {
    return Intl.message(
      'Password',
      name: 'register_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `create a password`
  String get register_page_title4_hint_text {
    return Intl.message(
      'create a password',
      name: 'register_page_title4_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `I agree to the `
  String get register_page_title5 {
    return Intl.message(
      'I agree to the ',
      name: 'register_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions `
  String get register_page_title6 {
    return Intl.message(
      'Terms and Conditions ',
      name: 'register_page_title6',
      desc: '',
      args: [],
    );
  }

  /// `and `
  String get register_page_title7 {
    return Intl.message(
      'and ',
      name: 'register_page_title7',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get register_page_title8 {
    return Intl.message(
      'Privacy Policy',
      name: 'register_page_title8',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get register_page_button {
    return Intl.message(
      'Sign Up',
      name: 'register_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get register_page_title9 {
    return Intl.message(
      'Already have an account? ',
      name: 'register_page_title9',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get register_page_title10 {
    return Intl.message(
      'Log in',
      name: 'register_page_title10',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forget_password_page_app_bar {
    return Intl.message(
      'Forget password',
      name: 'forget_password_page_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Sending OTP...`
  String get forget_password_page_title1 {
    return Intl.message(
      'Sending OTP...',
      name: 'forget_password_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get forget_password_page_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'forget_password_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get forget_password_page_title3 {
    return Intl.message(
      'Email address',
      name: 'forget_password_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get forget_password_page_button {
    return Intl.message(
      'Send',
      name: 'forget_password_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verify_code_page_app_bar {
    return Intl.message(
      'Verification',
      name: 'verify_code_page_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Sending OTP...`
  String get verify_code_page_title1 {
    return Intl.message(
      'Sending OTP...',
      name: 'verify_code_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get verify_code_page_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'verify_code_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Code sent to `
  String get verify_code_page_title3 {
    return Intl.message(
      'Code sent to ',
      name: 'verify_code_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify_code_page_button {
    return Intl.message(
      'Verify',
      name: 'verify_code_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive code? `
  String get verify_code_page_title4 {
    return Intl.message(
      'Don\'t receive code? ',
      name: 'verify_code_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get verify_code_page_title5 {
    return Intl.message(
      'Resend Code',
      name: 'verify_code_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_page_app_bar {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_page_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get reset_password_page_title1 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'reset_password_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get reset_password_page_title2 {
    return Intl.message(
      'New Password',
      name: 'reset_password_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Enter new password`
  String get reset_password_page_title2_hint_text {
    return Intl.message(
      'Enter new password',
      name: 'reset_password_page_title2_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get reset_password_page_title3 {
    return Intl.message(
      'Confirm Password',
      name: 'reset_password_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get reset_password_page_title3_hint_text {
    return Intl.message(
      'Confirm password',
      name: 'reset_password_page_title3_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password_page_button {
    return Intl.message(
      'Reset Password',
      name: 'reset_password_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Password reset \nsuccessfully`
  String get successful_reset_password_page_title1 {
    return Intl.message(
      'Password reset \nsuccessfully',
      name: 'successful_reset_password_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully change your \npassword. please use your new \npassword to login`
  String get successful_reset_password_page_title2 {
    return Intl.message(
      'You have successfully change your \npassword. please use your new \npassword to login',
      name: 'successful_reset_password_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Go to login`
  String get successful_reset_password_page_button {
    return Intl.message(
      'Go to login',
      name: 'successful_reset_password_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verify_email_page_app_bar {
    return Intl.message(
      'Verification',
      name: 'verify_email_page_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Sending OTP...`
  String get verify_email_page_title1 {
    return Intl.message(
      'Sending OTP...',
      name: 'verify_email_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the email address that you used when signed up for your account`
  String get verify_email_page_title2 {
    return Intl.message(
      'Please provide the email address that you used when signed up for your account',
      name: 'verify_email_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Code sent to `
  String get verify_email_page_title3 {
    return Intl.message(
      'Code sent to ',
      name: 'verify_email_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify_email_page_button {
    return Intl.message(
      'Verify',
      name: 'verify_email_page_button',
      desc: '',
      args: [],
    );
  }

  /// `Don't receive code? `
  String get verify_email_page_title4 {
    return Intl.message(
      'Don\'t receive code? ',
      name: 'verify_email_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get verify_email_page_title5 {
    return Intl.message(
      'Resend Code',
      name: 'verify_email_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get home_page_tab1 {
    return Intl.message(
      'Movies',
      name: 'home_page_tab1',
      desc: '',
      args: [],
    );
  }

  /// `TV Series`
  String get home_page_tab2 {
    return Intl.message(
      'TV Series',
      name: 'home_page_tab2',
      desc: '',
      args: [],
    );
  }

  /// `Plays`
  String get home_page_tab3 {
    return Intl.message(
      'Plays',
      name: 'home_page_tab3',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details_page_app_bar {
    return Intl.message(
      'Details',
      name: 'details_page_app_bar',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get details_page_title1 {
    return Intl.message(
      'Minutes',
      name: 'details_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Similar Movies`
  String get details_page_title2 {
    return Intl.message(
      'Similar Movies',
      name: 'details_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Similar Tv Series`
  String get details_page_title3 {
    return Intl.message(
      'Similar Tv Series',
      name: 'details_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `No similar movies found.`
  String get details_page_no_similar_movies {
    return Intl.message(
      'No similar movies found.',
      name: 'details_page_no_similar_movies',
      desc: '',
      args: [],
    );
  }

  /// `No similar TV series found.`
  String get details_page_no_similar_tv_series {
    return Intl.message(
      'No similar TV series found.',
      name: 'details_page_no_similar_tv_series',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated Tv Series`
  String get home_page_title1 {
    return Intl.message(
      'Top Rated Tv Series',
      name: 'home_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Popular Tv Series`
  String get home_page_title2 {
    return Intl.message(
      'Popular Tv Series',
      name: 'home_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Now Playing Tv Series`
  String get home_page_title3 {
    return Intl.message(
      'Now Playing Tv Series',
      name: 'home_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated Movies`
  String get home_page_title4 {
    return Intl.message(
      'Top Rated Movies',
      name: 'home_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Popular Movies`
  String get home_page_title5 {
    return Intl.message(
      'Popular Movies',
      name: 'home_page_title5',
      desc: '',
      args: [],
    );
  }

  /// `Now Playing Movies`
  String get home_page_title6 {
    return Intl.message(
      'Now Playing Movies',
      name: 'home_page_title6',
      desc: '',
      args: [],
    );
  }

  /// `Egyptian Plays`
  String get home_page_title7 {
    return Intl.message(
      'Egyptian Plays',
      name: 'home_page_title7',
      desc: '',
      args: [],
    );
  }

  /// `Action`
  String get default_category {
    return Intl.message(
      'Action',
      name: 'default_category',
      desc: '',
      args: [],
    );
  }

  /// `Search for movies`
  String get search_page_title1 {
    return Intl.message(
      'Search for movies',
      name: 'search_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `Search for TV series`
  String get search_page_title2 {
    return Intl.message(
      'Search for TV series',
      name: 'search_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `No movies in your watch list.`
  String get watch_list_page_title1 {
    return Intl.message(
      'No movies in your watch list.',
      name: 'watch_list_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `No TV series in your watch list.`
  String get watch_list_page_title2 {
    return Intl.message(
      'No TV series in your watch list.',
      name: 'watch_list_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get profile_page_title1 {
    return Intl.message(
      'My Profile',
      name: 'profile_page_title1',
      desc: '',
      args: [],
    );
  }

  /// `No Email`
  String get no_email {
    return Intl.message(
      'No Email',
      name: 'no_email',
      desc: '',
      args: [],
    );
  }

  /// `Upading Profile Image`
  String get profile_page_title2 {
    return Intl.message(
      'Upading Profile Image',
      name: 'profile_page_title2',
      desc: '',
      args: [],
    );
  }

  /// `Update Profile`
  String get profile_page_title3 {
    return Intl.message(
      'Update Profile',
      name: 'profile_page_title3',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get profile_page_title4 {
    return Intl.message(
      'Language',
      name: 'profile_page_title4',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get profile_page_title4_value1 {
    return Intl.message(
      'Arabic',
      name: 'profile_page_title4_value1',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get profile_page_title4_value2 {
    return Intl.message(
      'English',
      name: 'profile_page_title4_value2',
      desc: '',
      args: [],
    );
  }

  /// `Logging out...`
  String get profile_page_logout_loading {
    return Intl.message(
      'Logging out...',
      name: 'profile_page_logout_loading',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get profile_page_logout {
    return Intl.message(
      'Logout',
      name: 'profile_page_logout',
      desc: '',
      args: [],
    );
  }

  /// `Updating profile image...`
  String get profile_page_update_profile_image_loading {
    return Intl.message(
      'Updating profile image...',
      name: 'profile_page_update_profile_image_loading',
      desc: '',
      args: [],
    );
  }

  /// `Profile image updated successfully.`
  String get profile_page_update_profile_image_success {
    return Intl.message(
      'Profile image updated successfully.',
      name: 'profile_page_update_profile_image_success',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
