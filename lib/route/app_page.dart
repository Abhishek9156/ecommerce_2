import 'package:ecom/view/dashboard/dashboard_binding.dart';
import 'package:ecom/route/app_route.dart';
import 'package:ecom/view/dashboard/dashboards_screen.dart';
import 'package:get/get.dart';

class AppPage {
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinging())
  ];
}
