import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_starage_app_s11/core/app_assets/app_assets.dart';
import 'package:local_starage_app_s11/core/styles/App_colors.dart';
import 'package:local_starage_app_s11/core/styles/App_text_style.dart';
import 'package:local_starage_app_s11/core/widgets/space_widgets.dart.dart';
import 'package:local_starage_app_s11/features/home_screen/widgtes/custom_item_widget.dart';
import 'package:local_starage_app_s11/features/home_screen/widgtes/custom_top_home_part_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 30.sp),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTopHomePartWidget(),
            HightSpaceWidgets(height: 25),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Your Food",
                        style: AppTextStyle.black16Medium,
                      ),
                    ),
                    HightSpaceWidgets(height: 20),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 22.sp,
                          crossAxisSpacing: 16.sp,
                          childAspectRatio: 0.9,
                        ),
                        itemBuilder: (context, index) {
                          return CustomItemWidget(
                            imageUrl: AppAssets.topImgHS,
                            title: "Burger",
                            rate: 4.9,
                            time: "20-30",
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
