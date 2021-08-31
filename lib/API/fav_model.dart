class fav_model {
  bool status;

  String message;

  fav_model.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
  }
}
