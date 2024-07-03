///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
// ignore_for_file: unnecessary_null_comparison

class LoginModelDataPharmacyRegion {
/*
{
  "name": "Region adı",
  "address": "Region ünvanı"
} 
*/

  String? name;
  String? address;

  LoginModelDataPharmacyRegion({
    this.name,
    this.address,
  });
  LoginModelDataPharmacyRegion.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    address = json['address']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    return data;
  }
}

class LoginModelDataPharmacy {
/*
{
  "id": 2,
  "fcm_token": null,
  "type": 0,
  "region_id": 1,
  "email": "depo@gmail.com",
  "password": "$2y$10$ . ",
  "name": "Depo",
  "code": "null",
  "voen": "2349130870264085",
  "address": "Azadliq",
  "total_debt_pharmacy": "7083.31",
  "balance": "2150.36",
  "total_debt_warehouse": "4890.00",
  "currency": "AZN",
  "status": 1,
  "is_login": 1,
  "created_at": null,
  "updated_at": null,
  "delete": 0,
  "last_login_date": "2023-05-08 12:32:43",
  "region": {
    "name": "Region adı",
    "address": "Region ünvanı"
  }
} 
*/

  int? id;
  String? fcmToken;
  int? type;
  int? regionId;
  String? email;
  String? password;
  String? name;
  String? code;
  String? voen;
  String? address;
  String? totalDebtPharmacy;
  String? balance;
  String? totalDebtWarehouse;
  String? currency;
  int? status;
  int? isLogin;
  String? createdAt;
  String? updatedAt;
  int? delete;
  String? lastLoginDate;
  LoginModelDataPharmacyRegion? region;

  LoginModelDataPharmacy({
    this.id,
    this.fcmToken,
    this.type,
    this.regionId,
    this.email,
    this.password,
    this.name,
    this.code,
    this.voen,
    this.address,
    this.totalDebtPharmacy,
    this.balance,
    this.totalDebtWarehouse,
    this.currency,
    this.status,
    this.isLogin,
    this.createdAt,
    this.updatedAt,
    this.delete,
    this.lastLoginDate,
    this.region,
  });
  LoginModelDataPharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    fcmToken = json['fcm_token']?.toString();
    type = json['type']?.toInt();
    regionId = json['region_id']?.toInt();
    email = json['email']?.toString();
    password = json['password']?.toString();
    name = json['name']?.toString();
    code = json['code']?.toString();
    voen = json['voen']?.toString();
    address = json['address']?.toString();
    totalDebtPharmacy = json['total_debt_pharmacy']?.toString();
    balance = json['balance']?.toString();
    totalDebtWarehouse = json['total_debt_warehouse']?.toString();
    currency = json['currency']?.toString();
    status = json['status']?.toInt();
    isLogin = json['is_login']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    delete = json['delete']?.toInt();
    lastLoginDate = json['last_login_date']?.toString();
    region = (json['region'] != null)
        ? LoginModelDataPharmacyRegion.fromJson(json['region'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['fcm_token'] = fcmToken;
    data['type'] = type;
    data['region_id'] = regionId;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['code'] = code;
    data['voen'] = voen;
    data['address'] = address;
    data['total_debt_pharmacy'] = totalDebtPharmacy;
    data['balance'] = balance;
    data['total_debt_warehouse'] = totalDebtWarehouse;
    data['currency'] = currency;
    data['status'] = status;
    data['is_login'] = isLogin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['delete'] = delete;
    data['last_login_date'] = lastLoginDate;
    if (region != null) {
      data['region'] = region!.toJson();
    }
    return data;
  }
}

class LoginModelData {
/*
{
  "access_token": " . . ",
  "token_type": "bearer",
  "expires_in": "43200",
  "pharmacy": {
    "id": 2,
    "fcm_token": null,
    "type": 0,
    "region_id": 1,
    "email": "depo@gmail.com",
    "password": "$2y$10$ . ",
    "name": "Depo",
    "code": "null",
    "voen": "2349130870264085",
    "address": "Azadliq",
    "total_debt_pharmacy": "7083.31",
    "balance": "2150.36",
    "total_debt_warehouse": "4890.00",
    "currency": "AZN",
    "status": 1,
    "is_login": 1,
    "created_at": null,
    "updated_at": null,
    "delete": 0,
    "last_login_date": "2023-05-08 12:32:43",
    "region": {
      "name": "Region adı",
      "address": "Region ünvanı"
    }
  }
} 
*/

  String? accessToken;
  String? tokenType;
  String? expiresIn;
  LoginModelDataPharmacy? pharmacy;

  LoginModelData({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.pharmacy,
  });
  LoginModelData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token']?.toString();
    tokenType = json['token_type']?.toString();
    expiresIn = json['expires_in']?.toString();
    pharmacy = (json['pharmacy'] != null)
        ? LoginModelDataPharmacy.fromJson(json['pharmacy'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    if (pharmacy != null) {
      data['pharmacy'] = pharmacy!.toJson();
    }
    return data;
  }
}

class LoginModel {
/*
{
  "data": {
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvYXBwemV5dHVucGhhcm0uYXpcL2FwaVwvbG9naW4iLCJpYXQiOjE2ODM1MzQ3NjMsImV4cCI6MTY4MzUzNDgyMywibmJmIjoxNjgzNTM0NzYzLCJqdGkiOiJuUUhxYWdXRWFHdDFSbkVuIiwic3ViIjoyLCJwcnYiOiI1MjJhMWE2NWUxMjY4ODNjNGFiMDUwNDRhMDQzNzU1ZTk4ZTI1NTVjIn0.2vRKwWjTnnpFYkf7bg53iS6iUIGkqbl43EuATT5iqtg",
    "token_type": "bearer",
    "expires_in": "43200",
    "pharmacy": {
      "id": 2,
      "fcm_token": null,
      "type": 0,
      "region_id": 1,
      "email": "depo@gmail.com",
      "password": "$2y$10$FdQI5V27eonSP.X7PbeN8OOsvN6EN9ikezXNJGD4bsMsGEmIhPqDS",
      "name": "Depo",
      "code": "null",
      "voen": "2349130870264085",
      "address": "Azadliq",
      "total_debt_pharmacy": "7083.31",
      "balance": "2150.36",
      "total_debt_warehouse": "4890.00",
      "currency": "AZN",
      "status": 1,
      "is_login": 1,
      "created_at": null,
      "updated_at": null,
      "delete": 0,
      "last_login_date": "2023-05-08 12:32:43",
      "region": {
        "name": "Region adı",
        "address": "Region ünvanı"
      }
    }
  },
  "errors": null
} 
*/

  LoginModelData? data;
  String? errors;

  LoginModel({
    this.data,
    this.errors,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    data =
        (json['data'] != null) ? LoginModelData.fromJson(json['data']) : null;
    errors = json['errors']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = errors;
    return data;
  }
}
