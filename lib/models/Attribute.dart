class Attributes {
  int id;
  String name;
  String orderby;

  Attributes({
    this.id,
    this.name,
    this.orderby,
  });
  Attributes.fromjosn(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderby = json['order_by'];
  }
}
