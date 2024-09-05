// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:zeytun_app/UI/chat/thread.dart';
import 'package:zeytun_app/UI/contact/contact_view.dart';
import 'package:zeytun_app/UI/detail/debt_more.dart';
import 'package:zeytun_app/UI/detail/detail_view.dart';
import 'package:zeytun_app/UI/important_information/important_information_view.dart';
import 'package:zeytun_app/UI/invoices/invoices.dart';
import 'package:zeytun_app/UI/payments/payments.dart';
import 'package:zeytun_app/UI/detail/total_debt.dart';
import 'package:zeytun_app/UI/chat/chat.dart';
import 'package:zeytun_app/UI/home_page/home.dart';
import 'package:zeytun_app/UI/login/login.dart';
import 'package:zeytun_app/UI/notification/notification_view.dart';
import 'package:zeytun_app/UI/select_pharmacy/select_pharmacy.dart';
import 'package:zeytun_app/UI/settings/settings.dart';
import 'package:zeytun_app/UI/worker/worker_view.dart';
import 'package:zeytun_app/blinding/blinding.dart';
import 'package:zeytun_app/routes/app_routes.dart';

import '../UI/unregistered/unregistered.dart';

final binding = HomeBinding();

class AppPages {
  static final home = GetPage(
    name: AppRoutes.HOME,
    page: () => LoginView(),
    binding: binding,
  );
  static final chat = GetPage(
    name: AppRoutes.CHAT,
    page: () => const ChatView(),
    binding: binding,
  );
  static final invoices = GetPage(
    name: AppRoutes.INVOICES,
    page: () => const InvoicesView(),
    binding: binding,
  );
  static final thread = GetPage(
    name: AppRoutes.THREAD,
    page: () => const ThreadView(),
    binding: binding,
  );
  static final main = GetPage(
    name: AppRoutes.MAIN,
    page: () => const HomeView(),
    binding: binding,
  );
  static final notification = GetPage(
    name: AppRoutes.NOTIFICATIONS,
    page: () => const NotificationView(),
    binding: binding,
  );
  static final detail = GetPage(
    name: AppRoutes.DETAIL,
    page: () => const DetailView(),
    binding: binding,
  );
  static final hesabatdetail = GetPage(
    name: AppRoutes.HESABATDETAIL,
    page: () => const TotalDebtView(),
    binding: binding,
  );
  static final debtmore = GetPage(
    name: AppRoutes.DEBTMORE,
    page: () => const DebtMoreView(),
    binding: binding,
  );
  static final payments = GetPage(
    name: AppRoutes.PAYMENTS,
    page: () => const PaymentsView(),
    binding: binding,
  );
  static final contact = GetPage(
    name: AppRoutes.CONTACT,
    page: () => const ContactView(),
    binding: binding,
  );
  static final info = GetPage(
    name: AppRoutes.IMPORTANTINFORMATION,
    page: () => const ImportantInformation(),
    binding: binding,
  );
  static final unregistered = GetPage(
    name: AppRoutes.UNREGISTERED,
    page: () => const UnregisteredView(),
    binding: binding,
  );
  static final settings = GetPage(
    name: AppRoutes.SETTINGS,
    page: () => const SettingsView(),
    binding: binding,
  );
  static final selectPharmacy = GetPage(
    name: AppRoutes.SELECTPHARMACY,
    page: () => const SelectPharmacyView(),
    binding: binding,
  );
  static final worker = GetPage(
    name: AppRoutes.WORKER,
    page: () => const WorkerView(),
    binding: binding,
  );

  static final List<GetPage> pages = [
    home,
    main,
    chat,
    invoices,
    thread,
    notification,
    detail,
    hesabatdetail,
    debtmore,
    payments,
    contact,
    info,
    unregistered,
    settings,
    selectPharmacy,
    worker
  ];
}
