import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gazal/conf.dart';
import 'package:gazal/models/Attribute.dart';
import 'package:gazal/models/customer.dart';
import 'package:gazal/models/database.dart';
import 'package:gazal/models/user_details.dart';
import 'package:gazal/models/category.dart';
import 'package:gazal/models/product.dart';
import 'package:gazal/models/orderRetrive.dart';

import 'package:gazal/models/users.dart';

class APIService {
  bool ret = false;

  var authToken;
  int id;
  String phone;
  String attributeId;
  String productId;
  String attributeName;
  String productName;

  Future<bool> createCustomer(
    CustomerModel model,
    String attributeId,
    String productId,
    String attributeName,
    String productName,
  ) async {
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );
    this.attributeId = attributeId;
    this.productId = productId;
    this.attributeName = attributeName;
    this.productName = productName;

    // bool ret = false;
    try {
      var response = await Dio().post(
          "https://gazal.ae/wp-json/wc/v1/customers?consumer_key=ck_8d1c63acb26fa01e3b75658c59baeac60a087220&consumer_secret=cs_3ca3bb3e7a5a854b6607b6f7d6e81bf37772c381",
          data: model.tojson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      print(response.statusCode.toString() + "kia hay");
      if (response.statusCode == 201) {
        phone = model.phone;
        await createCustomerDetails(model.email, model.password);
        // ret = true;

      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  //edit costomer Details

  Future<bool> editCustomer(
    CustomerModel model,
    int customerid,
    String attributeId,
    String productId,
    String attributeName,
    String productName,
  ) async {
    print("this part is working fine");
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );
    this.id = customerid;
    this.attributeId = attributeId;
    this.productId = productId;
    this.attributeName = attributeName;
    this.productName = productName;
// print ("this part is working fine");
    // print (id.toString()+model.password+model.firstName+model.lastName+model.phone);
    bool ret = false;
    try {
      var response = await Dio().put(
          "https://gazal.ae/wp-json/wc/v1/customers/$id?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",
          data: model.tojson(),

          // model.tojson(),
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        ret = true;
        phone = model.phone;
        createCustomerDetails(model.email, model.password);
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  //order
  String userNameMain;

  Future<UserDetails> createCustomerDetails(
      String userName, String password) async {
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    UserDetails userModel;

    try {
      var response =
          await Dio().post("https://gazal.ae/wp-json/jwt-auth/v1/token",
              data: {"username": userName, "password": password},
              options: new Options(headers: {
                HttpHeaders.contentTypeHeader:
                    "application/x-www-form-urlencoded",
              }));

      if (response.statusCode == 200) {
        userModel = UserDetails.fromJson(response.data);
        userNameMain = userName;

        await createOrder(userModel);
      }
    } on DioError catch (e) {}
    return userModel;
  }

  Future<bool> createOrder(UserDetails userModel) async {
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    id = userModel.data.id;
    try {
      var response = await Dio().post(
          "https://gazal.ae/wp-json/wc/v1/orders?customer_id=165&consumer_key=ck_8d1c63acb26fa01e3b75658c59baeac60a087220&consumer_secret=cs_3ca3bb3e7a5a854b6607b6f7d6e81bf37772c381",
          data: {
            "customer_id": userModel.data.id,
            "billing": {
              "first_name": userModel.data.firstName,
              "last_name": userModel.data.lastName,
              "phone": phone,
              "email": userModel.data.email,
            },
            "shipping": {
              "first_name": userModel.data.firstName,
              "last_name": userModel.data.lastName,
              "email": userModel.data.email,
            },
            "line_items": [
              {
                "name": attributeName + "--" + productName,
                "product_id": int.parse(productId),
                "variation_id": int.parse(productId) + int.parse(attributeId),
                "quantity": 1,
              }
            ],
          },

          //we will resmure from here after pryer
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 201) {
        ret = true;
        User user;

        SQLiteDbProvider.db.getAllUsers();

        if (user == null) {
          getCustomers(id);
          CustomerModel data2 = new CustomerModel();
          await SQLiteDbProvider.db.insert(
            userModel.data.id,
            userModel.data.firstName,
            userModel.data.lastName,
            userModel.data.phone,
            userModel.data.email,
            userModel.data.password,
          );
        } else {
          await SQLiteDbProvider.db.update(
              userModel.data.id,
              userModel.data.firstName,
              userModel.data.lastName,
              phone,
              userModel.data.email,
              "password");
        }
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }
    return ret;
  }

  //Create order 2

  Future<bool> createOrder2(
      int customerID,
      String fastName2,
      String lastName2,
      String phone2,
      String email2,
      String attributeId2,
      String attributeName2,
      String productId2,
      String productName2) async {
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    print("first Stage");

    bool ret = false;
    try {
      var response = await Dio().post(
          "https://gazal.ae/wp-json/wc/v1/orders?customer_id=$customerID&consumer_key=ck_8d1c63acb26fa01e3b75658c59baeac60a087220&consumer_secret=cs_3ca3bb3e7a5a854b6607b6f7d6e81bf37772c381",
          data: {
            "customer_id": customerID,
            "billing": {
              "first_name": fastName2,
              "last_name": lastName2,
              "phone": phone2,
              "email": email2,
            },
            "shipping": {
              "first_name": fastName2,
              "last_name": lastName2,
              "email": email2,
            },
            
            "line_items": [
              {
                "name": attributeName2 + "--" + productName2,
                "product_id": int.parse(productId2),
                "variation_id": int.parse(productId2) + int.parse(attributeId2),
                "quantity": 1,
              }
            ],
          },

          //we will resmure from here after pryer
          options: new Options(headers: {
            HttpHeaders.authorizationHeader: "Basic $authToken",
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      print("second Stage");
      print(response.statusCode);
      if (response.statusCode == 201) {
        ret = true;
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        ret = false;
      } else {
        ret = false;
      }
    }

    return ret;
  }

//startaing the category

  Future<List<Category>> getCategories() async {
    List<Category> data = new List<Category>();
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      // Response  response = await Dio().get("https://demo.mozzotech.com/wp-json/wc/v1/products/categories?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",

      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/products/categories?consumer_key=ck_51703421083519b766e9b734056b741b27b55ecd&consumer_secret=cs_d3857b734706b89cc429b1a50411ae564a7b1efc",

// var response=await Dio().post(Config.url,data:model.tojson(),
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Category.fromjosn(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }

  //RETRIVE Customer

  Future<List<CustomerModel>> getCustomers(int id) async {
    List<CustomerModel> data = new List<CustomerModel>();
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      // Response  response = await Dio().get("https://demo.mozzotech.com/wp-json/wc/v1/products/categories?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",

      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/customers/165?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",
// var response=await Dio().post(Config.url,data:model.tojson(),
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => CustomerModel.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }

    return data;
  }

//Starting Products

  Future<List<Product>> getProduct({
    String tagid,
    String strname,
    int pageNumber,
    int pageSize,
    String strSearch,
    String tagName,
    String categoryid,
    String sortBy,
    String sortOrder,
  }) async {
    List<Product> data = new List<Product>();
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      String parmeter = "";
      if (strSearch != null) {
        parmeter += "&search=$strSearch";
      }
      if (strname != null) {
        parmeter += "&slug=$strname";
      } else {}

      if (pageSize != null) {
        parmeter += "&per_page=$pageSize";
      }

      if (pageNumber != null) {
        parmeter += "&page=$pageNumber";
      }

      if (tagName != null) {
        parmeter += "&tag=$tagName";
      }

      if (sortBy != null) {
        parmeter += "&orderby=$sortBy";
      }
      if (categoryid != null) {
        parmeter += "&category=$categoryid";
      }

      if (sortOrder != null) {
        parmeter += "&order=$sortOrder";
      }
      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/Products?per_page=100&consumer_key=ck_51703421083519b766e9b734056b741b27b55ecd&consumer_secret=cs_d3857b734706b89cc429b1a50411ae564a7b1efc${parmeter.toString()}",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Product.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }

  Future<List<Attributes>> getAttributes() async {
    List<Attributes> data = new List<Attributes>();
    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/products/attributes?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a&order_by=id",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => Attributes.fromjosn(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }

//retrive

  Future<List<OrderRetrive>> getOrder(int id) async {
    List<OrderRetrive> data = new List<OrderRetrive>();

    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      // Response  response = await Dio().get("https://demo.mozzotech.com/wp-json/wc/v1/products/categories?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",

      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/orders?customer=$id&consumer_key=ck_51703421083519b766e9b734056b741b27b55ecd&consumer_secret=cs_d3857b734706b89cc429b1a50411ae564a7b1efc",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => OrderRetrive.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }

  //retrive order
  Future<List<OrderRetrive>> getOrders(int id) async {
    List<OrderRetrive> data = new List<OrderRetrive>();

    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      // Response  response = await Dio().get("https://demo.mozzotech.com/wp-json/wc/v1/products/categories?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",

      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/Orders?customer_id=$id&consumer_key=ck_51703421083519b766e9b734056b741b27b55ecd&consumer_secret=cs_d3857b734706b89cc429b1a50411ae564a7b1efc",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => OrderRetrive.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }

//  retrive order 2

//retrive order
  Future<List<OrderRetrive>> newGetOrders(int id) async {
    List<OrderRetrive> data = new List<OrderRetrive>();

    authToken = base64.encode(
      utf8.encode(Config.key + ":" + Config.screte),
    );

    try {
      // Response  response = await Dio().get("https://demo.mozzotech.com/wp-json/wc/v1/products/categories?consumer_key=ck_793fd64197969ad4f2cdbb641f7dccb32b805bd2&consumer_secret=cs_c849a90db68aa86f992db59cc05bb05cdf7b790a",

      Response response = await Dio().get(
          "https://gazal.ae/wp-json/wc/v1/orders?customer=$id&consumer_key=ck_8d1c63acb26fa01e3b75658c59baeac60a087220&consumer_secret=cs_3ca3bb3e7a5a854b6607b6f7d6e81bf37772c381",
          options: new Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }));

      if (response.statusCode == 200) {
        data = (response.data as List)
            .map(
              (i) => OrderRetrive.fromJson(i),
            )
            .toList();
      }
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
      } else {}
    }
    return data;
  }
}
