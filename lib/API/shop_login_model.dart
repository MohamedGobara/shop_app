class shopLoginModel {
  bool status;

  String message;
  UserData data;

  shopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] != null ? UserData.fromJson(json["data"]) : null;
  }
}

class UserData {
   int id;

  String name;

  String email;

  String phone;

  String image;

  int points;

  int credit;

  String token;

  UserData.fromJson(Map<String, dynamic> jsonMap) {
     id = jsonMap["id"];
    name = jsonMap["name"];
    email = jsonMap["email"];
    phone = jsonMap["phone"];
    image = jsonMap["image"];
    points = jsonMap["points"];
    credit = jsonMap["credit"];
    token = jsonMap["token"];
  }
}
