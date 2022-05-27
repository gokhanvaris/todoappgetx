import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todoapp_getx/config/app_pages.dart';
import 'package:todoapp_getx/config/app_routes.dart';
import 'package:todoapp_getx/data/repository/bindings/network_bindings.dart';
import 'package:todoapp_getx/ui/home/view/home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: NetworkControllerBindings(),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
