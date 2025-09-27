import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_starage_app_s11/core/styles/App_colors.dart';
import 'package:local_starage_app_s11/core/styles/App_text_style.dart';
import 'package:local_starage_app_s11/core/widgets/space_widgets.dart.dart';

class CustomItemWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rate;
  final String time;
  final Function()? onTap;
  const CustomItemWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rate,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imageUrl, width: 137.w, height: 106.h),
              HightSpaceWidgets(height: 8),
              SizedBox(
                width: 120.w,

                child: Text(
                  title,
                  maxLines: 1,
                  style: AppTextStyle.black16Medium,
                ),
              ),
              HightSpaceWidgets(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      Text(
                        rate.toString(),
                        style: AppTextStyle.grey14Medium.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.lock_clock,
                        color: AppColors.primaryColor,
                        size: 16.sp,
                      ),
                      Text(
                        time.toString(),
                        style: AppTextStyle.grey14Medium.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
