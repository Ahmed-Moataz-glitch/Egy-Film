import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/home/presentation/view/pages/home_page.dart';
import 'package:egy_film/features/profile/presentation/view/pages/profile_page.dart';
import 'package:egy_film/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:egy_film/features/search/presentation/view/pages/search_page.dart';
import 'package:egy_film/features/watch_list/presentation/view/pages/watch_list_page.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
// import 'package:flutter_svg/svg.dart';

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  late final ProfileCubit profileCubit;

  @override
  void initState() {
    super.initState();
    profileCubit = getIt<ProfileCubit>();
  }

  @override
  void dispose() {
    profileCubit.close();
    super.dispose();
  }

  List<PersistentTabConfig> tabs(BuildContext context) => [
    PersistentTabConfig(
      screen: const HomePage(),
      item: ItemConfig(
        activeForegroundColor: AppColors.yellow,
        inactiveForegroundColor: AppColors.gray.withAlpha(170),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: AppColors.yellow,
        ),
        icon: const Icon(Icons.home),
        title: S.of(context).bottom_nav_bar_home,
      ),
    ),
    PersistentTabConfig(
      screen: const SearchPage(),
      item: ItemConfig(
        activeForegroundColor: AppColors.yellow,
        inactiveForegroundColor: AppColors.gray.withAlpha(170),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: AppColors.yellow,
        ),
        icon: const Icon(Icons.search),
        title: S.of(context).bottom_nav_bar_search,
      ),
    ),
    PersistentTabConfig(
      screen: const WatchListPage(),
      item: ItemConfig(
        activeForegroundColor: AppColors.yellow,
        inactiveForegroundColor: AppColors.gray.withAlpha(170),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: AppColors.yellow,
        ),
        icon: const Icon(Icons.bookmark),
        title: S.of(context).bottom_nav_bar_watch_list,
      ),
    ),
    PersistentTabConfig(
      screen: const ProfilePage(),
      item: ItemConfig(
        activeForegroundColor: AppColors.yellow,
        inactiveForegroundColor: AppColors.gray.withAlpha(170),
        textStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: AppColors.yellow,
        ),
        icon: const Icon(Icons.person),
        title: S.of(context).bottom_nav_bar_profile,
      ),
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        backgroundColor: AppColors.dark,
        margin: EdgeInsets.only(top: 8.h),
        tabs: tabs(context),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(
            padding: EdgeInsets.only(top: 8.h),
            border: Border(
              top: BorderSide(color: AppColors.yellow, width: 1.1),
            ),
            color: AppColors.dark.withAlpha(150),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      // backgroundColor: AppColors.dark,
      // unselectedFontSize: 13,
      // selectedFontSize: 14,
      // selectedItemColor: AppColors.yellow,
      // unselectedItemColor: AppColors.gray.withAlpha(170),
      // type: BottomNavigationBarType.fixed,
      // showSelectedLabels: true,
      // selectedLabelStyle: TextStyle(
      //   fontWeight: FontWeight.w500,
      //   fontSize: 16,
      //   color: AppColors.yellow,
      // ),
      // unselectedLabelStyle: TextStyle(
      //   fontWeight: FontWeight.w400,
      //   fontSize: 15,
      //   color: AppColors.gray.withAlpha(170),
      // ),
      //   currentIndex: index,
      //   onTap: (selectedIndex) {
      //     index = selectedIndex;
      //     setState(() {});
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-home.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 0 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.home
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-cart.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 1 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.school,
      //       ),
      //       label: 'Learn',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-favourite.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 2 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.groups,
      //       ),
      //       label: 'Community',
      //     ),
      //     BottomNavigationBarItem(
      //       // icon: SvgPicture.asset(
      //       //   'assets/icons/icon-profile.svg',
      //       //   height: 23,
      //       //   width: 23,
      //       //   fit: BoxFit.cover,
      //       //   color: index == 3 ? Color(0xff212121) : Color(0xff5C5C5C),
      //       // ),
      //       icon: Icon(
      //         Icons.person,
      //       ),
      //       label: 'Person',
      //     ),
      //   ],
      // ),
      // body: Center(child: pages[index]),
    );
  }
}
