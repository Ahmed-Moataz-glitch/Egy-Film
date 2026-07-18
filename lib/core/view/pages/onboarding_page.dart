import 'package:animate_do/animate_do.dart';
import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/features/auth/presentation/view/pages/login_page.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! image onboarding
              SizedBox(
                height: 250.h,
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemBuilder: (context, index) => CustomAnimatedWidget(
                    delay: index,
                    index: index,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: index == 0 ? Image.asset(
                        AppAssets.egyFilm2Image,
                        fit: BoxFit.fill,
                      ) : Lottie.asset(
                        onboardingList(context)[index].imagePath,
                        height: size.height * 0.2,
                        fit: index == 0
                        ? BoxFit.fill
                        : BoxFit.contain,
                      ),
                    ),
                  ),
                  itemCount: onboardingList(context).length,
                ),
              ),
              SizedBox(height: 35.h),
              //! indicator onboarding
              SmoothPageIndicator(
                controller: controller,
                count: onboardingList(context).length,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  dotWidth: 10.w,
                  dotHeight: 10.h,
                  dotColor: AppColors.gray.withAlpha(50),
                  activeDotColor: AppColors.black.withAlpha(220),
                ),
              ),
              //! title onboarding and description onboarding
              SizedBox(height: 50.h),
              CustomAnimatedWidget(
                delay: (index + 1) * 100,
                index: index,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.w),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        onboardingList(context)[index].title,
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                          // backgroundColor: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        onboardingList(context)[index].description,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black.withAlpha(120),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              //! button next onboarding
              MainButtonWidget(
                title: index < onboardingList(context).length - 1 ? S.of(context).next : S.of(context).get_started,
                onPressed: () {
                  if (index < onboardingList(context).length - 1) {
                    controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  } else {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// data class
class OnboardingData {
  final String title;
  final String description;
  final String image;
  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

// data onboarding
class OnboardingModel {
  final String title;
  final String description;
  final String imagePath;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}
List<OnboardingModel> onboardingList(BuildContext context) => [
  OnboardingModel(
    title: S.of(context).onboading_page_title1,
    description: S.of(context).onboarding_page_title1_description,
    imagePath: AppAssets.egyFilm2Image,
  ),
  OnboardingModel(
    title: S.of(context).onboarding_page_title2,
    description: S.of(context).onboarding_page_title2_description,
    imagePath: AppAssets.mosalsalLottie,
  ),
  OnboardingModel(
    title: S.of(context).onboarding_page_title3,
    description:  S.of(context).onboarding_page_title3_description,
    imagePath: AppAssets.filmLottie,
  ),
  OnboardingModel(
    title: S.of(context).onboarding_page_title4,
    description: S.of(context).onboarding_page_title4_description,
    imagePath: AppAssets.masrahiaLottie,
  ),
];

class CustomAnimatedWidget extends StatelessWidget {
  const CustomAnimatedWidget({
    super.key,
    required this.index,
    required this.delay,
    required this.child,
  });
  final int index;
  final int delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
