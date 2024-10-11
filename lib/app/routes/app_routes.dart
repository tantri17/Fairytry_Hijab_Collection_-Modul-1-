part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOMEPAGE = _Paths.HOMEPAGE;
  static const LOGIN = _Paths.LOGIN;
  static const ROOMDETAIL = _Paths.ROOMDETAIL;
  static const ROOMVASILITY = _Paths.ROOMVASILITY;
  static const SHARE_LINK = _Paths.SHARE_LINK;
  static const CHATS = _Paths.CHATS;
  static const CHECKOUTPENGAJUAN = _Paths.CHECKOUTPENGAJUAN;
  static const CHECKIN_DATE = _Paths.CHECKIN_DATE;
  static const MESSAGE = _Paths.MESSAGE;
  static const SUCCESS_PAGE = _Paths.SUCCESS_PAGE;
}

abstract class _Paths {
  _Paths._();
  static const HOMEPAGE = '/homepage';
  static const LOGIN = '/login';
  static const ROOMDETAIL = '/roomdetail';
  static const ROOMVASILITY = '/roomvasility';
  static const SHARE_LINK = '/share-link';
  static const CHATS = '/chats';
  static const CHECKOUTPENGAJUAN = '/checkoutpengajuan';
  static const CHECKIN_DATE = '/checkin-date';
  static const MESSAGE = '/message';
  static const SUCCESS_PAGE = '/success-page';
}
