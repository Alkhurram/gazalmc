class User {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  static final columns = [
    "id",
    "firstName",
    "lastName",
    "phone",
    "email",
    "password"
  ];  
  User(
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.password,
  );
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      data['id'],
      data['firstName'],
      data['lastName'],
      data['phone'],
      data['email'],
      data['password'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.addAll({
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "email": email,
      "password": password,
    });
    return map;
  }
}
