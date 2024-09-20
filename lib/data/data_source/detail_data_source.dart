// ignore_for_file: body_might_complete_normally_nullable, avoid_print

import 'dart:developer';

import 'package:zeytun_app/core/dio/dio_confing.dart';
import 'package:zeytun_app/core/notwork_path.dart';
import 'package:zeytun_app/data/model/contact_model.dart';
import 'package:zeytun_app/data/model/debt_model.dart';
import 'package:zeytun_app/data/model/debt_profit_model.dart';
import 'package:zeytun_app/data/model/invoices_model.dart';
import 'package:zeytun_app/data/model/payments_model.dart';
import 'package:zeytun_app/data/model/total_debt_model.dart';

class DetailDataSource {
  Future<TotalDebtModel?> getTotalDebt({id}) async {
    try {
      var response =
          await clientDio.get("${NetworkPath.TOTALDEBT.rawValue}$id");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return TotalDebtModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DebtProfitModel?> getDebtProfit({id}) async {
    try {
      var response =
          await clientDio.get("${NetworkPath.DEBTPROFIT.rawValue}$id");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return DebtProfitModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<DebtMoreModel?> getDebtMore({id}) async {
    try {
      var response = await clientDio.get("${NetworkPath.DEBTMORE.rawValue}$id");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return DebtMoreModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<PaymentsModel?> getPayments({id}) async {
    log("url:::: ${"${clientDio.options.baseUrl+NetworkPath.PAYMENTS.rawValue}$id"}");
    try {
      var response = await clientDio.get("${NetworkPath.PAYMENTS.rawValue}$id");
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return PaymentsModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Invoices?> getInvoices() async {
    log("url::::------ ${clientDio.options.baseUrl+NetworkPath.INVOICES.rawValue}");
    try {
      var response = await clientDio.get(NetworkPath.INVOICES.rawValue);
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return Invoices.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?> getInvoiceDetail(String operation, String type,
      String amount, String date, String guid) async {
    log("url::::------ ${NetworkPath.INVOICE.rawValue}");
    try {
      var response = await clientDio.post(NetworkPath.INVOICE.rawValue, data: {
        "Operation": operation,
        "Type": type,
        "Amount": amount,
        "Date": date,
        "GUID": guid
      });
      log("response detail code ${response.statusCode}");
      log("response detail body ${response.data}");
      if (response.statusCode == 200) {
        return response.data["data"];
      }
    } catch (e) {
      print(e);
    }
  }

  Future<ContactModel?> getContact() async {
    try {
      var response = await clientDio.get(NetworkPath.CONTACT.rawValue);
      if (response.statusCode == 200) {
        if (response.data['data'] != null) {
          return ContactModel.fromJson(response.data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
