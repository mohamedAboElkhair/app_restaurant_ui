import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_starage_app_s11/core/app_assets/app_assets.dart';
import 'package:local_starage_app_s11/core/styles/App_colors.dart';
import 'package:local_starage_app_s11/core/styles/App_text_style.dart';

class CustomTopHomePartWidget extends StatefulWidget {
  const CustomTopHomePartWidget({super.key});

  @override
  State<CustomTopHomePartWidget> createState() =>
      _CustomTopHomePartWidgetState();
}

class _CustomTopHomePartWidgetState extends State<CustomTopHomePartWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homeScreenImg,
          width: double.infinity,
          height: 270.h,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 20.w,
          top: 30.h,
          bottom: 30.h,
          child: Container(
            width: 200.w,
            height: 150.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Text(
              "Welcome Add A New Recipe",
              textAlign: TextAlign.center,
              style: AppTextStyle.onBoardingTitleStyle,
            ),
          ),
        ),
      ],
    );
  }
}
