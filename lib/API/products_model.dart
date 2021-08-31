class products_model {
  bool status;

  HomeModelData data;

  products_model.fromJson(var  json) {
    status = json["status"];
    data = HomeModelData.fromJson(json["data"]);
  }
}

class HomeModelData {
 var banner ;

  var  products ;

  HomeModelData.fromJson(var json) {
    json["banners"].forEach((e) {
      banner.add(e);
    });
    json["products"].forEach((e) {
      products.add(e);
    });
  }
}

class BannersModel {
  int id;

  String image;

  BannersModel.fromJson(var json) {
    id = json["id"];
    image = json["image"];
  }
}

class productsModel {
  int id;

  dynamic price;

  dynamic oldPrice;

  dynamic discount;

  String image;

  String name;

  productsModel.fromJson(var json) {
    id = json["id"];
    price = json["price"];
    image = json["image"];
    oldPrice = json["old_price"];
    discount = json["discount"];
  }
}
