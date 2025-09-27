import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:local_starage_app_s11/core/app_assets/app_assets.dart';
import 'package:local_starage_app_s11/core/routing/app_routes.dart';
import 'package:local_starage_app_s11/core/styles/App_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:local_starage_app_s11/core/styles/App_text_style.dart';
import 'package:local_starage_app_s11/core/widgets/space_widgets.dart.dart';
import 'package:local_starage_app_s11/features/onboarding/on_boarding_services/on_boarding_services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<String> titles = [
    'Save Your Meals Ingredient',
    'Use Our App The Best Choice',
    ' Our App Your Ultimate Choice',
  ];
  List<String> descriptions = [
    'All the best restaurants and their top menus are ready for you',
    'Add Your Meals and its Ingredients  and we will save it for you',
    'the best choice for your kitchen  do not hesitate',
  ];
  int currentPage = 0;
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      bool isFirstTime = OnBoardingServices.isFirstTime();
      OnBoardingServices.setFirstTimeWithFalse();
    
      if (isFirstTime == false) {
        context.pushReplacement(AppRoutes.homeScreen);
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.onBoardImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Positioned(
              bottom: 18.h,
              right: 32.w,
              left: 32.w,
              child: Container(
                width: 334.w,
                height: 400.h,

                padding: EdgeInsets.all(21.sp),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(48.r),
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: 350.h,
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        onPageChanged: (index, reason) => setState(() {
                          currentPage = index;
                        }),
                      ),

                      items: List.generate(titles.length, (index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: 252.w,
                              // width: MediaQuery.of(context).size.width,
                              // margin: EdgeInsets.symmetric(horizontal: 5.0),
                              // decoration: BoxDecoration(color: Colors.amber),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      titles[index],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle.onBoardingTitleStyle,
                                    ),
                                    HightSpaceWidgets(height: 16.h),
                                    Text(
                                      descriptions[index],
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle
                                          .onBoardingDescriptionStyle,
                                    ),
                                    HightSpaceWidgets(height: 10),
                                    DotsIndicator(
                                      dotsCount: titles.length,
                                      position: currentPage.toDouble(),
                                      decorator: DotsDecorator(
                                        color: Color(0xffc2c2c2),
                                        // Inactive color
                                        activeColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5.0,
                                          ),
                                        ),
                                        size: const Size(24, 6),
                                        activeSize: const Size(24, 6),
                                        activeShape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            5.0,
                                          ),
                                        ),
                                      ),
                                      onTap: (index) {
                                        carouselController.animateToPage(index);
                                        currentPage = index;
                                        setState(() {});
                                      },
                                    ),
                                    HightSpaceWidgets(height: 25),
                                    currentPage >= titles.length - 1
                                        ? InkWell(
                                            onTap: () {
                                              GoRouter.of(
                                                context,
                                              ).pushReplacement(
                                                AppRoutes.homeScreen,
                                              );
                                            },

                                            child: Container(
                                              width: 62.sp,
                                              height: 62.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: AppColors.whiteColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: AppColors.primaryColor,
                                                size: 30.sp,
                                              ),
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  GoRouter.of(
                                                    context,
                                                  ).pushReplacement(
                                                    AppRoutes.homeScreen,
                                                  );
                                                },
                                                child: Text(
                                                  "Skip",
                                                  style: AppTextStyle
                                                      .white14samibold,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  if (currentPage <
                                                      titles.length) {
                                                    currentPage++;
                                                    carouselController
                                                        .animateToPage(
                                                          currentPage,
                                                        );
                                                    setState(() {});
                                                  }
                                                },
                                                child: Text(
                                                  "Next",
                                                  style: AppTextStyle
                                                      .white14samibold,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }),
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
