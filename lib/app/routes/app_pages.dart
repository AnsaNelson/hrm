import 'package:get/get.dart';

import '../modules/ClientDetails/bindings/client_details_binding.dart';
import '../modules/ClientDetails/views/client_details_view.dart';
import '../modules/ClientWork/bindings/client_work_binding.dart';
import '../modules/ClientWork/views/client_work_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Profile/bindings/profile_binding.dart';
import '../modules/Profile/views/profile_view.dart';
import '../modules/WorkDetails/bindings/work_details_binding.dart';
import '../modules/WorkDetails/views/work_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_DETAILS,
      page: () => const ClientDetailsView(),
      binding: ClientDetailsBinding(),
    ),
    GetPage(
      name: _Paths.WORK_DETAILS,
      page: () => WorkDetailsView(),
      binding: WorkDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CLIENT_WORK,
      page: () => const ClientWorkView(),
      binding: ClientWorkBinding(),
    ),
  ];
}
