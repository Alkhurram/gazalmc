class CustomerModel {
  String email;
  String firstName;
  String lastName;
  String password;
  List billing;
  String phone;

  CustomerModel({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.phone,
    this.billing,
  });
  CustomerModel.fromJson(Map<String, dynamic> json) {

    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    billing=[
    firstName = json['first_name'],
    lastName = json['last_name'],
    phone=json['phone'],

    ];


  }
  Map<String, dynamic> tojson() {
    Map<String, dynamic> map = {};
    map.addAll({
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'username': email,
      "billing": {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone
      },
      "shipping": {
        "first_name": firstName,
        "last_name": lastName,
      },
    });
    return map;
  }
}
