import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/view_model/language_cubit/language_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({super.key});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  late String selectedLanguage;

  @override
  Widget build(BuildContext context) {
    selectedLanguage = switch (LanguageCubit.get(context).currentLanguage) {
      LanguageModeState.arabic => S.of(context).profile_page_title4_value1,
      LanguageModeState.english => S.of(context).profile_page_title4_value2,
    };
    return DropdownButton(
      value: selectedLanguage,
      isExpanded: true,
      dropdownColor: AppColors.dark,
      style: TextStyle(color: AppColors.fillColor, fontSize: 16.sp, fontWeight: FontWeight.w600),
      underline: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.transparent, width: 1.r),
        ),
      ),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.fillColor,
        size: 24.sp,
      ),
      items: [
        DropdownMenuItem(
          value: S.of(context).profile_page_title4_value1,
          child: Text(
            S.of(context).profile_page_title4_value1,
            style: TextStyle(color: AppColors.fillColor),
          ),
          onTap: () async {
            await LanguageCubit.get(
              context,
            ).selectLanguage(LanguageModeState.arabic);
          },
        ),
        DropdownMenuItem(
          value: S.of(context).profile_page_title4_value2,
          child: Text(
            S.of(context).profile_page_title4_value2,
            style: TextStyle(color: AppColors.fillColor),
          ),
          onTap: () async {
            await LanguageCubit.get(
              context,
            ).selectLanguage(LanguageModeState.english);
          },
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedLanguage = value!;
        });
      },
    );
  }
}
