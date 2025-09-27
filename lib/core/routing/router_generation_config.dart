import 'package:go_router/go_router.dart';
import 'package:local_starage_app_s11/core/routing/app_routes.dart';
import 'package:local_starage_app_s11/features/home_screen/home_screen.dart';
import 'package:local_starage_app_s11/features/onboarding/on_boarding_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.onBoardingScreen,
    routes: [
      GoRoute(
        path: AppRoutes.onBoardingScreen,
        name: AppRoutes.onBoardingScreen,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
