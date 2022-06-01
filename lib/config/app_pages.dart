import 'package:get/get.dart';
import '../data/repository/bindings/network_bindings.dart';
import '../ui/home/view/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      binding: NetworkControllerBindings(),
    ),
  ];
}
