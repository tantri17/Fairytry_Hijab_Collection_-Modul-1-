import 'package:get/get.dart';

import '../modules/Message/bindings/message_binding.dart';
import '../modules/Message/views/message_view.dart';
import '../modules/Roomdetail/bindings/roomdetail_binding.dart';
import '../modules/Roomdetail/views/roomdetail_view.dart';
import '../modules/SuccessPage/bindings/success_page_binding.dart';
import '../modules/SuccessPage/views/success_page_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOMEPAGE;
  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.ROOMDETAIL,
      page: () => const RoomDetailView(
        roomTitle: '',
        description: '',
        price: '',
        imagePaths: [],
      ),
      binding: RoomdetailBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => ChatView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: '/chat',
      page: () => ChatView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.SUCCESS_PAGE,
      page: () => SuccessPage(),
      binding: SuccessPageBinding(),
    ),
    GetPage(
      name: '/success',
      page: () => SuccessPage(),
    ),
    GetPage(
      name: '/',
      page: () => HomepageView(),
    ),
  ];
}
