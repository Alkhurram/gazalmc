class OrderRetrive {
  int id;
  String currency;
  String dateCreated;
  String dataModificad;
  String total;
  String status;
  // ignore: non_constant_identifier_names
  List<LineItem> line_items;
  Billing billing;

  // ignore: non_constant_identifier_names
  // List<LineItem> line_items;

  OrderRetrive({
    this.id,
    this.currency,
    this.dateCreated,
    this.dataModificad,
    this.total,
    this.status,
    // ignore: non_constant_identifier_names
    this.line_items,
    this.billing,
  });

  OrderRetrive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    dateCreated = json['date_created'];
    dataModificad = json['date_modified'];
    total = json['total'];
    status = json['status'];
    billing =
    json['billing'] != null ? new Billing.fromJson(json['billing']) : null;

    if (json['line_items'] != null) {
      line_items = new List<LineItem>();
      json['line_items'].forEach((v) {
        line_items.add(new LineItem.fromJson(v));
      });
    }
  }



    // if (json['billing'] != null) {
    //   billing = new List<Billing>();
    //   json['billing'].forEach((v) {
    //     billing.add(new Billing.fromJson(v));
    //   });
    // }
  }


class LineItem {
  int id;
  String name;
  int productID;
  int variationID;

  LineItem({
    this.id,
    this.name,
    this.productID,
    this.variationID,
  });

  LineItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productID = json['product_id'];
    variationID = json['variation_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_id'] = this.productID;
    data['variation_id'] = this.variationID;
    return data;
  }
}




class Billing {
  String firstName;
  String lastName;
  String email;
  String phone;

  Billing({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

