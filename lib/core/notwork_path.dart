// ignore_for_file: dead_code, constant_identifier_names

enum NetworkPath {
  LOGIN,
  LOGOUT,
  PHARMACY,
  REFRESHTOKEN,
  NOTIFICATIONS,
  TOTALDEBT,
  DEBTPROFIT,
  DEBTMORE,
  PAYMENTS,
  CONTACT,
  INFO,
  UNREGISTERED,
  CHANGEPASSWORD
}

extension StringPathValue on NetworkPath {
  String get rawValue {
    switch (this) {
      case NetworkPath.LOGIN:
        return 'login';
        break;
      case NetworkPath.PHARMACY:
        return 'pharmacy/list';
        break;
      case NetworkPath.REFRESHTOKEN:
        return 'refresh';
        break;
      case NetworkPath.LOGOUT:
        return 'logout';
        break;
      case NetworkPath.NOTIFICATIONS:
        return 'notification/list';
        break;
      case NetworkPath.TOTALDEBT:
        return 'pharmacy/total-debt/';
        break;
      case NetworkPath.DEBTPROFIT:
        return 'pharmacy/debt-profit/';
        break;
      case NetworkPath.DEBTMORE:
        return 'pharmacy/detailed-report/';
        break;
      case NetworkPath.PAYMENTS:
        return 'pharmacy/payments/';
        break;
      case NetworkPath.CONTACT:
        return 'contacts/list';
        break;
      case NetworkPath.INFO:
        return 'news/list/';
        break;
      case NetworkPath.UNREGISTERED:
        return 'pharmacy/no-login-list/';
        break;
      case NetworkPath.CHANGEPASSWORD:
        return 'pharmacy/change-password';
        break;
    }
  }
}
