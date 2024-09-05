class Invoices {
  Data? data;

  Invoices({this.data});

  Invoices.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Invoices{data: $data}';
  }
}

class Data {
  List<AttributesModel>? data;

  Data({this.data});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = [];
      json['Data'].forEach((v) {
        data!.add(AttributesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Data{data: $data}';
  }
}

class AttributesModel {
  Attributes? attributes;

  AttributesModel({this.attributes});

  AttributesModel.fromJson(Map<String, dynamic> json) {
    attributes = json['@attributes'] != null
        ? new Attributes.fromJson(json['@attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attributes != null) {
      data['@attributes'] = attributes!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'AttributesModel{attributes: $attributes}';
  }
}

class Attributes {
  String? operation;
  dynamic type;
  dynamic amount;
  String? date;
  String? gUID;

  Attributes({this.operation, this.type, this.amount, this.date, this.gUID});

  Attributes.fromJson(Map<String, dynamic> json) {
    operation = json['Operation'];
    type = json['Type'];
    amount = json['Amount'];
    date = json['Date'];
    gUID = json['GUID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Operation'] = operation;
    data['Type'] = type;
    data['Amount'] = amount;
    data['Date'] = date;
    data['GUID'] = gUID;
    return data;
  }

  @override
  String toString() {
    return 'Attributes{operation: $operation, type: $type, amount: $amount, date: $date, gUID: $gUID}';
  }
}
