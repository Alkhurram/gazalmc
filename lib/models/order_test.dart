class OrderDetails {
  String firtName;
  String lastName;
  String address_1;
  String address_2;
  String country = "UAE";
  String city = "dubai";
  String state = '-';
  String postcode = '22223';
  String email;
  String phone;
  String productID;
  String attrubiteID;
  String quantity;

  OrderDetails({
    this.firtName,
    this.lastName,
    this.address_1,
    this.address_2,
    this.city,
    this.country,
    this.postcode,
    this.email,
    this.phone,
    this.productID,
    this.attrubiteID,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'payment_method': 'cash on deliver',
      'payment_method_title': 'Cash on Deliver',
      'set_paid': false,
      "billing": {
        "first_name": firtName,
        "last_name": lastName,
        "address_1": address_1,
        "address_2": address_2,
        "city": city,
        "postcode": '786786',
        "country": "UAE",
        "email": email,
        "phone": phone,
      },
      "shipping": {
        "first_name": firtName,
        "last_name": lastName,
        "address_1": address_1,
        "address_2": address_2,
        "city": city,
        "postcode": '786786',
        "country": 'UAE',
      },
      "line_items": {
        "product_id": productID,
        "variation_id": attrubiteID,
        "quantity": quantity,
      },
    });
    return map;
  }
}
