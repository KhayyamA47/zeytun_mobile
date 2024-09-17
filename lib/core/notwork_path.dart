// ignore_for_file: dead_code, constant_identifier_names

enum NetworkPath {
  LOGIN,
  LOGOUT,
  INVOICES,
  INVOICE,
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
  THREAD,
  REPORTS,
  MESSAGESLIST,
  SENDMESSAGE,
  CREATETHREAD,
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
      case NetworkPath.INVOICES:
        return 'pharmacy/qaimeler';
        break;
      case NetworkPath.INVOICE:
        return 'pharmacy/invoice';
        break;
      case NetworkPath.REFRESHTOKEN:
        return 'refresh';
        break;
      case NetworkPath.THREAD:
        return 'thread/list';
      case NetworkPath.REPORTS:
        return 'thread/qebzler';
        break;
      case NetworkPath.MESSAGESLIST:
        return 'thread/messages';
        break;
      case NetworkPath.SENDMESSAGE:
        return 'thread/send-messages';
        break;
      case NetworkPath.CREATETHREAD:
        return 'thread/send-pharmacy';
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
