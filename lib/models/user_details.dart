class UserDetails {
  bool success;
  int statusCode;
  String code;
  String message;
  Data data;

  UserDetails({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
    // this.id,
    // this.firstName,
    // this.lastName,
  });

  UserDetails.fromJson(Map<String, dynamic> json) {
    success = json['sucess'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['message'] = this.message;

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;



  Data({
    this.token,
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.password,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
phone=json["phone"];
    email = json['email'];
    password=json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;

    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
