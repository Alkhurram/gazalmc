class CustomerDetails {
  int id;
  String firstName;
  Billing billing;
  Shipping shipping;
  LineItem lineItem;

  CustomerDetails({
    this.id,
    this.firstName,
    this.billing,
    this.shipping,
    this.lineItem,
  });
  CustomerDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    firstName = json["firstName"];
    billing =
        json['billing'] != null ? new Billing.fromJson(json['billing']) : null;
    shipping = json['shipping'] != null
        ? new Shipping.fromJson(json['shipping'])
        : null;

    lineItem = json['lineItem'] != null
        ? new LineItem.fromJson(json['lineItem'])
        : null;
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'id': id,
      'first_name': firstName,
      'billing': {
        'first_name': firstName,
        'last_name': billing.lastName,
        'address_1': billing.address1,
        'address_2': billing.address2,
        'city': billing.city,
        'country': billing.country,
        'state': billing.state,
        'postcode': billing.postcode,
        'email': billing.email,
        'phone': billing.phone,
      },
      'shipping': {
        'first_name': billing.firstName,
        'last_name': billing.lastName,
        'address_1': billing.address1,
        'address_2': billing.address2,
        'city': billing.city,
        'country': billing.country,
        'state': billing.state,
        'postcode': billing.postcode,
        'email': billing.email,
        'phone': billing.phone,
      },
      'lineItem': {
        'product_id': lineItem.productid,
        'quantity': lineItem.quantity,
        'variation_id': lineItem.variationid,
      }
    });
    return map;
  }
}

class Billing {
  String firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String country;
  String state;
  String postcode;
  String email;
  String phone;

  Billing({
    this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.postcode,
    this.email,
    this.phone,
    this.state,
  });

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    country = json['country'];
    postcode = json['postcode'];
    state = json['state'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['country_name'] = this.country;
    data['city_name'] = this.city;
    data['postcode'] = this.postcode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['state'] = this.state;
    return data;
  }
}

class LineItem {
  String productid;
  String quantity;
  String variationid;
  LineItem({this.productid, this.quantity, this.variationid});

  LineItem.fromJson(Map<String, dynamic> json) {
    productid = json['product_id'];
    quantity = json['quantity'];
    variationid = json['variation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productid;
    data['quanity'] = this.quantity;
    data['variation_id'] = this.variationid;

    return data;
  }
}

class Shipping {
  String firstName;
  String lastName;
  String address1;
  String address2;
  String city;
  String country;
  String state;
  String postcode;
  String email;
  String phone;
  Shipping({
    this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.postcode,
    this.email,
    this.phone,
    this.state,
  });

  Shipping.fromJson(Map<String, dynamic> json) {
    firstName = json['first_Name'];
    lastName = json['last_Name'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    country = json['country'];
    postcode = json['postcode'];
    state = json['state'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['country_name'] = this.country;
    data['city_name'] = this.city;
    data['postcode'] = this.postcode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['state'] = this.state;
    return data;
  }
}
